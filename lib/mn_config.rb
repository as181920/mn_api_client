module MnClient
  module Configuration
    class << self
      attr_accessor :api_host, :api_port, :api_url

      def api_host
        @api_host ||= 'localhost'
      end

      def api_port
        @api_port ||= '9000'
      end

      def api_url
        @api_url = "http://#{api_host}:#{api_port}"
      end
    end
  end
end

