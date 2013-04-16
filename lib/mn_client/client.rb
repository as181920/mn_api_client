require "mn_client/api/business"

module MnClient
  class Client
    include MnClient::API::Business

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

    def request(method, path, params={}, signature_params=params)
      Httparty.send method, 
      connection.send(method.to_sym, path, params) do |request|
        request.headers[:authorization] = auth_header(method.to_sym, path, signature_params).to_s
      end.env
    #rescue Faraday::Error::ClientError
    #  raise Twitter::Error::ClientError
    #rescue MultiJson::DecodeError
    #  raise Twitter::Error::DecodeError
    #rescue
    #  raise MnClient::Error::RequestError
    end

  end
end


=begin
puts sign

response = HTTParty.get "http://api.dianping.com/v1/business/find_businesses?city=%E4%B8%8A%E6%B5%B7&appkey=#{key}&sign=#{sign}"
p response
=end
