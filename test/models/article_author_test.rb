require 'test_helper'

class ArticleAuthorTest < ActiveSupport::TestCase
  # Validations
  test "should belong to an article" do
    assert_invalid? ArticleAuthor.new, article: "must exist"
  end

  test "should belong to a author" do
    assert_invalid? ArticleAuthor.new, author: "must exist"
  end

  test "should have a unique pair article, author" do
    assert_invalid? article_authors(:bullshit_juan).dup, article: "has already been taken"
  end

  test "should be valid if all requirements are met" do
    assert_valid? ArticleAuthor.new(article: articles(:legit), author: authors(:juan))
  end

  test "fixtures should be valid" do
    assert_valid? article_authors(:bullshit_juan)
  end
end
