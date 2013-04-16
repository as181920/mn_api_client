# encoding: utf-8

require "digest/md5"

module MnClient
  module API
    module Auth

      def generate_signature(params,app_key,app_secret)
        params_str = params.keys.sort.map{|key| [key,params[key]] }.flatten.join
        sign = app_key+params_str+app_secret
        Digest::SHA1.hexdigest(sign).upcase
      end

    end
  end
end

