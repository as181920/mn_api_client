require 'minitest/autorun'
require 'mn_client'
require "pry"

describe MnClient do
  before  do
  end

  describe "CRUD for Note" do
    it "get notes with correct format" do
      notes = Note.get :all
      notes.must_be_instance_of Her::Collection
      notes.last.must_be_instance_of Note
      notes.last.must_respond_to :note
      notes.last.note.keys.must_include "id"
      notes.last.note.keys.must_include "name"
      notes.last.note.keys.must_include "description"
      notes.last.note.keys.must_include "created_at"
      notes.last.note.keys.must_include "updated_at"
    end
  end
end
