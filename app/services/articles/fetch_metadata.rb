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
    author_names = Articles::FetchMetadata::FetchAuthors.new.call(page)
    authors = author_names.map { |name| Author.find_or_create_by!(name: name) }
    article.authors = authors
    article.save!
  end

  def add_tags!
    tag_names = FetchTags.new.call(page)
    tags = tag_names.map { |name| Tag.find_or_create_by!(name: name) }
    article.tags = tags
    article.save!
  end
end
