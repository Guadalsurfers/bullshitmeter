require 'test_helper'
require "mocha/test_unit"

class RateArticleTest < ActiveSupport::TestCase
  setup do
    @user = users(:francisco)
    @article = articles(:bullshit)
  end

  test "should create a new vote for an article" do
    service = mock('Articles::FindOrCreate service')
    Articles::FindOrCreate.expects(:new).with('https://url').returns(service)
    service.expects(:call).returns(@article)

    assert_difference '@user.votes.count' do
      assert_equal 0, @article.bs_index

      Articles::Rate.new(@user, { rating: 0.5, article_url: 'https://url' }).call

      assert_equal 0.25, @article.bs_index
    end
  end
end
