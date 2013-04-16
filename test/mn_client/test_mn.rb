# encoding: utf-8
require 'minitest/autorun'
require 'mn_client'

describe MnClient do
  before  do
    @client = MnClient::Client.new
  end

  describe "find by city" do
    it "first test" do
      businesses = @client.find_businesses({city: '上海'})
      businesses.to_s.wont_be_empty
    end

  end
end
