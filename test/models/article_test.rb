require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  # Default values
  test 'bs_index is 0.5 by default' do
    assert_equal 0.5, Article.new.bs_index
  end

  # Validations
  test 'should have an url' do
    assert_invalid? Article.new, url: "can't be blank"
  end

  test 'should have a unique url' do
    assert_invalid? articles(:bullshit).dup, url: "has already been taken"
  end

  test 'bs_index should be greater than or equal to 0' do
    assert_invalid? Article.new(bs_index: -0.1), bs_index: 'must be greater than or equal to 0'
  end

  test 'bs_index should be less than or equal to 1' do
    assert_invalid? Article.new(bs_index: 1.1), bs_index: 'must be less than or equal to 1'
  end

  test 'must be valid if all requirements are met' do
    assert_valid? Article.new(url: 'https://cosa.example.com/blah')
  end

  test 'fixtures must be valid' do
    assert_valid? articles(:bullshit)
    assert_valid? articles(:legit)
  end
end
