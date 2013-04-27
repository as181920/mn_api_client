require "helper"

describe MnClient do
  before  do
    @client = MnClient::Client.new
  end

  describe "get note use client" do
    it "get notes with correct format" do
      notes = @client.all_notes
      notes.must_be_instance_of Array
      notes.last.keys.must_include "note"
      notes.last['note'].keys.must_include 'id'
      notes.last['note'].keys.must_include 'name'
      notes.last['note'].keys.must_include 'description'
      notes.last['note'].keys.must_include 'created_at'
      notes.last['note'].keys.must_include 'updated_at'
    end

    it "use http method and path to get result" do
      notes = @client.get "/notes"
      notes.must_be_instance_of Array
      notes.last.keys.must_include "note"
      notes.last['note'].keys.must_include 'id'
      notes.last['note'].keys.must_include 'name'
      notes.last['note'].keys.must_include 'description'
      notes.last['note'].keys.must_include 'created_at'
      notes.last['note'].keys.must_include 'updated_at'
    end
  end
end
