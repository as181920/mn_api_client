# encoding: utf-8

require "mn_client/api/utils"

module MnClient
  module API
    module Business
      include MnClient::API::Utils

      def find_businesses(options={})
        res = send :get, "/Records/gem", options
        res
      end
    end
  end
end

