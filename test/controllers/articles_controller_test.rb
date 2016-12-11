require 'test_helper'
require 'mocha/mini_test'

class Api::ArticlesControllerTest < ActionDispatch::IntegrationTest
  # When user is logged in
  test "get show should be successful for existing articles and user cannot vote" do
    article = articles(:bullshit)
    get api_article_url(url: article.url)

    result = JSON.parse(response.body)
    expected_result = {
      'article' => JSON.parse(article.to_json),
      'can_vote' => false,
      'num_votes' => 1
    }

    assert_equal expected_result, result
    assert_response :success
  end

  test "get show should be successful for existing articles and user can vote" do
    article = articles(:legit)
    get api_article_url(url: article.url)

    result = JSON.parse(response.body)
    expected_result = {
      'article' => JSON.parse(article.to_json),
      'can_vote' => true,
      'num_votes' => 0
    }

    assert_equal expected_result, result
    assert_response :success
  end

  test "get show should be successful for non existing articles" do
    get api_article_url(url: 'https://unexisting.example.com/url')

    result = JSON.parse(response.body)
    expected_result = {
      'article' => nil,
      'can_vote' => true,
      'num_votes' => 0
    }

    assert_equal expected_result, result
    assert_response :success
  end

  # When user is not logged in
  test "get show should be successful for non existing articles when user is not logged in" do
    Api::ArticlesController.any_instance.stubs(:current_user).returns(nil)

    get api_article_url(url: 'https://unexisting.example.com/url')

    result = JSON.parse(response.body)
    expected_result = {
      'article' => nil,
      'can_vote' => false,
      'num_votes' => 0
    }

    assert_equal expected_result, result
    assert_response :success
  end

  test "get show should be successful for existing articles and user is not logged in" do
    Api::ArticlesController.any_instance.stubs(:current_user).returns(nil)

    article = articles(:bullshit)
    get api_article_url(url: article.url)

    result = JSON.parse(response.body)
    expected_result = {
      'article' => JSON.parse(article.to_json),
      'can_vote' => false,
      'num_votes' => 1
    }

    assert_equal expected_result, result
    assert_response :success
  end
end
