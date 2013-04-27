require "faraday"
require 'em-http'
require "mn_client/response/parse_json"
require "mn_client/response/raise_error"

module MnClient
  module Connection

    def connection
      @connection ||= Faraday.new(url: MnClient::Configuration.api_url) do |connection|
        connection.request :url_encoded
        connection.response :logger
        connection.use Faraday::Adapter::EMSynchrony # make http request with eventmachine and synchrony
        connection.use MnClient::Response::ParseJson # Parse JSON response bodies using MultiJson
        connection.use MnClient::Response::RaiseError
      end
    end

  end
end

