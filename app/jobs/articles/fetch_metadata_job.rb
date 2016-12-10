class Articles::FetchMetadataJob < ApplicationJob
  queue_as :default

  def perform(article_id)
    Articles::FetchMetadata.new(article_id).call
  end
end
