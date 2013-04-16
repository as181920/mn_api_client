# encoding: utf-8

require "yaml"
require "httparty"
require "mn_client/api/auth"

module MnClient
  module API
    module Utils
      include MnClient::API::Auth

      def send(request_method, path, options={})
        #sign = generate_signature(options,app_key,app_secret)
        query = URI.encode_www_form options
        response = ::HTTParty.send request_method, "http://localhost:9000#{path}"
        response.parsed_response
      end


      private

      def app_key
        @app_key ||= config["app_key"]
      end

      def app_secret
        @app_secret ||= config["app_secret"]
      end

      def config
        YAML.load_file(File.join(File.dirname(__FILE__),"../../../config/dianping.yml"))
      end

    end
  end
end


