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
    authors = FetchAuthors.new.call(page)
    authors.each { |author_name| article.authors.find_or_create_by!(name: author_name)}
  end

  def add_tags!
    tags = FetchTags.new.call(page)
    tags.each { |tag_name| article.tags.find_or_create_by!(name: tag_name)}
  end
end
