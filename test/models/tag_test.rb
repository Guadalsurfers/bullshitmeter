require 'test_helper'

class TagTest < ActiveSupport::TestCase
  # Validations
  test "should have a name" do
    assert_invalid? Tag.new, name: "can't be blank"
  end

  test "should have a unique name, value" do
    assert_invalid? tags(:economy).dup, name: "has already been taken"
  end

  test "should be valid if all requirements are met" do
    assert_valid? Tag.new(name: 'sports')
  end

  test "fixtures should be valid" do
    assert_valid? tags(:economy)
  end

  # Relationships
  test "should have many articles" do
    assert_equal Set.new([articles(:bullshit)]), Set.new(tags(:economy).articles)
  end

  test "should delete article_tag when destroying" do
    assert_difference "ArticleTag.count", -1 do
      tags(:economy).destroy!
    end
  end
end
