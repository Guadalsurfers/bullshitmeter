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
end
