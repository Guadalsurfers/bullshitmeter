class Articles::Rate
  def initialize(user, params)
    @user = user
    @rating = params[:rating]
    @url = params[:article_url]
  end

  def call
    vote = Vote.create(user: user, article: article, rating: rating)
    calculate_bs_index if vote.persisted?

    vote
  end

  private

  def article
    @article ||= Articles::FindOrCreate.new(url).call
  end

  def calculate_bs_index
    bs_index = article.votes.sum(:rating).to_f / article.votes.count
    @article.update!(bs_index: bs_index)
  end

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
