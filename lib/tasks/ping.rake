require "net/http"

namespace :ping do
  desc "Pings PING_URL to keep a dyno alive"
  task dyno: :environment do
    uri = URI("https://bullshitmeter.herokuapp.com")
    Rails.logger.info Net::HTTP.get_response(uri)
  end
end
