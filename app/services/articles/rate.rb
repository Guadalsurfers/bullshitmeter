class Articles::Rate
  def initialize(user, params)
    @user = user
    @rating = params[:rating]
    @url = params[:article_url]
  end

  def call
    article = Articles::FindOrCreate.new(url).call
    Vote.create(user: user, article: article, rating: rating)
  end

  private

  def user
    @user
  end

  def url
    @url
  end

  def rating
    @rating
  end
end
