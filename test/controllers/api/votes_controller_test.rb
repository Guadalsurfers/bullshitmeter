require 'test_helper'
require 'mocha/mini_test'

class Api::VotesControllerTest < ActionDispatch::IntegrationTest
  test "post create should be successful" do
    Api::VotesController.stubs(:current_user).with(users(:paco))
    service = mock('Articles::Rate service')
    Articles::Rate.expects(:new).returns(service)
    service.expects(:call).returns(votes(:bullshit_negative))

    post "/api/votes", params: { vote: { article_url: 'https://articles.example.com/foo', rating: 'neutral' } }

    assert_response :success
  end
end
