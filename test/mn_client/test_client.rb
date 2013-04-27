require 'minitest/autorun'
require 'mn_client'
require "pry"

describe MnClient do
  before  do
    @client = MnClient::Client.new
  end

  describe "CRUD for Note" do
    it "get notes with correct format" do
      notes = @client.all_notes
      notes.must_be_instance_of Array
      notes.last.keys.must_include :note
      notes.last[:note].keys.must_include :id
      notes.last[:note].keys.must_include :name
      notes.last[:note].keys.must_include :description
      notes.last[:note].keys.must_include :created_at
      notes.last[:note].keys.must_include :updated_at
    end
  end
end
