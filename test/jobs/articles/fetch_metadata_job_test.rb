require 'test_helper'
require 'mocha/mini_test'

class Articles::FetchMetadataJobTest < ActiveJob::TestCase
  test "should call service Articles::FetchMetadata" do
    article_id = articles(:bullshit).id
    service = mock('Articles::FetchMetadata Service')
    Articles::FetchMetadata.expects(:new).with(article_id).returns(service)
    service.expects(:call)

    Articles::FetchMetadataJob.perform_now(article_id)
  end
end
