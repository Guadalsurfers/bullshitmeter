require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  # Validations
  test "should belong to a user" do
    assert_invalid? Vote.new, user: "must exist"
  end

  test "should belong to an article" do
    assert_invalid? Vote.new, article: "must exist"
  end

  test "should have a rating" do
    assert_invalid? Vote.new, rating: "can't be blank"
  end

  test "user and article should be unique" do
    assert_invalid? votes(:bullshit_negative).dup, article: "has already been taken"
  end

  test 'rating should be greater than or equal to 0' do
    assert_invalid? Vote.new(rating: -0.1), rating: 'must be greater than or equal to 0'
  end

  test 'rating should be less than or equal to 1' do
    assert_invalid? Vote.new(rating: 1.1), rating: 'must be less than or equal to 1'
  end

  test "should be valid if all requirements are met" do
    assert_valid? Vote.new(article: articles(:legit), user: users(:paco), rating: 1)
  end

  test "fixtures should be valid" do
    assert_valid? votes(:bullshit_negative)
  end
end
