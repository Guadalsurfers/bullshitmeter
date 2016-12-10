class Articles::FindOrCreate
  def initialize(url)
    @url = url
  end

  def call
    article = Article.find_by(url: url)
    unless article
      article = Article.find_or_create_by(url: url)
      Articles::FetchMetadataJob.perform_later(article.id) if article.persisted?
    end
    article
  end

  private

  def url
    @url
  end
end
