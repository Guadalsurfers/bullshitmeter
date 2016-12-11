require 'nokogiri'
require 'open-uri'

class Articles::FetchMetadata
  def initialize(article_id)
    @article_id = article_id
  end

  def call
    return unless page

    add_authors!
    add_tags!
  end

  private

  def article
    @article ||= Article.find(@article_id)
  end

  def page
    @page ||= Nokogiri::HTML(open(article.url))
  end

  def add_authors!
    author_names = FetchAuthors.new.call(page)
    article.authors = Author.where(name: author_names)
    article.save!
  end

  def add_tags!
    tag_names = FetchTags.new.call(page)
    article.tags = Tag.where(name: tag_names)
    article.save!
  end
end
