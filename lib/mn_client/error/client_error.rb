require "mn_client/error"

module MnClient
  class Error
    # Raise when MnClient returns a 4xx HTTP status code or there's an error in Httparty
    class ClientError < MnClient::Error
      # Create a new error from an HTTP environment
      #
      # @param response [Hash]
      # @return [MnClient::Error]
      def self.from_response(response={})
        new(parse_error(response[:body]), response[:response_headers])
      end

      private

      def self.parse_error(body)
        if body.nil?
          ''
        elsif body[:error]
          body[:error]
        elsif body[errors]
          first = Array(body[errors]).first
          if first.kind_of?(Hash)
            first[:message].chomp
          else
            first.chomp
          end
        end
      end

    end
  end
end

