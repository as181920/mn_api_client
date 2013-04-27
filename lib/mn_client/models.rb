require "her"
require 'em-http'

Her::API.setup url: "http://localhost:9000" do |connection|
  connection.use Faraday::Request::UrlEncoded
  connection.response :logger
  connection.use Her::Middleware::DefaultParseJSON
  #connection.use Faraday::Adapter::NetHttp
  connection.use Faraday::Adapter::EMSynchrony # make http request with eventmachine and synchrony
end

LIB_PATH = File.dirname(File.absolute_path(__FILE__))

Dir[File.dirname(__FILE__) + '/models/*.rb'].each {|file| require file}
