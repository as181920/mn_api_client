require "faraday"
require 'em-http'
#require "mn_client/connection"
#require "mn_client/request"
require "mn_client/response/parse_json"
require "mn_client/response/raise_error"
require "mn_client/api/note"

module MnClient
  class Client
    include MnClient::API::Note

    # Initializes a new Client object
    #
    # @param options [Hash]
    # @return [MnClient::Client]
    def initialize(options={})
    end

    # Perform an HTTP DELETE request
    def delete(path, params={})
      request(:delete, path, params)
    end

    # Perform an HTTP GET request
    def get(path, params={})
      request(:get, path, params)
    end

    # Perform an HTTP POST request
    def post(path, params={})
      signature_params = params.values.any?{|value| value.respond_to?(:to_io)} ? {} : params
      request(:post, path, params, signature_params)
    end

    # Perform an HTTP PUT request
    def put(path, params={})
      request(:put, path, params)
    end

    private

    def request(method, path, params={})
      connection.send(method.to_sym, path, params).body
    end

    def connection
      @connection ||= Faraday.new(url: "http://localhost:9000") do |faraday|
        faraday.request :url_encoded
        faraday.response :logger
        faraday.use Faraday::Adapter::EMSynchrony # make http request with eventmachine and synchrony
        faraday.use MnClient::Response::ParseJson # Parse JSON response bodies using MultiJson
      end
    end

  end
end

