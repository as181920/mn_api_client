require "faraday"
require 'em-http'
require "mn_client/response/parse_json"
require "mn_client/response/raise_error"

module MnClient
  module Connection

    def connection
      @connection ||= Faraday.new(url: "http://localhost:9000") do |faraday|
        faraday.request :url_encoded
        faraday.response :logger
        faraday.use Faraday::Adapter::EMSynchrony # make http request with eventmachine and synchrony
        faraday.use MnClient::Response::ParseJson # Parse JSON response bodies using MultiJson
        faraday.use MnClient::Response::RaiseError
      end
    end

  end
end

