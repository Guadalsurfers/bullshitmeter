require 'nokogiri'
require 'open-uri'

class Articles::FetchMetadata
  def initialize(article_id)
    @article_id = article_id
  end

  def call
    return unless article

    page = Nokogiri::HTML(open(article.url))

    # Parse HTML and create tags
  end

  private

  def article
    @article ||= Article.find(article_id)
  end
end
