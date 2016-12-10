require 'test_helper'

class ArticleTagTest < ActiveSupport::TestCase
  # Validations
  test "should belong to an article" do
    assert_invalid? ArticleTag.new, article: "must exist"
  end

  test "should belong to a tag" do
    assert_invalid? ArticleTag.new, tag: "must exist"
  end

  test "should have a unique pair article, tag" do
    assert_invalid? article_tags(:bullshit_economy).dup, tag: "has already been taken"
  end

  test "should be valid if all requirements are met" do
    assert_valid? ArticleTag.new(article: articles(:legit), tag: tags(:economy))
  end

  test "fixtures should be valid" do
    assert_valid? article_tags(:bullshit_economy)
  end
end
