require 'test_helper'
require "mocha/test_unit"

class FindOrCreateArticleTest < ActiveSupport::TestCase
  test "should return existing article if url already exists" do
    assert_equal articles(:bullshit), Articles::FindOrCreate.new(articles(:bullshit).url).call
  end

  test "should create a new article if url doesn't exist" do
    assert_difference "Article.count" do
      Articles::FetchMetadataJob.expects(:perform_now)
      Articles::FindOrCreate.new('https://awesome.article.com/article').call
    end
  end
end
