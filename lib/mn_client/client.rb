require "faraday"
require "mn_client/connection"
require "mn_client/request"
require "mn_client/response/parse_json"
require "mn_client/response/raise_error"
require "mn_client/api/note"

module MnClient
  class Client
    include MnClient::Connection
    include MnClient::Request
    include MnClient::API::Note

    # Initializes a new Client object
    #
    # @param options [Hash]
    # @return [MnClient::Client]
    def initialize(options={})
    end

  end
end

