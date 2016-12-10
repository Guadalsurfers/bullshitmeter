require 'test_helper'
require "mocha/test_unit"

class RateArticleTest < ActiveSupport::TestCase
  setup do
    @user = users(:paco)
  end

  test "should create a new vote for an article" do
    service = mock('Articles::FindOrCreate service')
    Articles::FindOrCreate.expects(:new).with('https://url').returns(service)
    service.expects(:call).returns(articles(:legit))

    assert_difference '@user.votes.count' do
      Articles::Rate.new(@user, { rating: 'neutral', article_url: 'https://url' }).call
    end
  end
end
