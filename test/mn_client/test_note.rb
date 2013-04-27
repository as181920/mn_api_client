require "helper"

describe MnClient do
  before  do
  end

  describe "CRUD for Note" do
    it "get notes with correct format" do
      notes = Note.get :all
      notes.must_be_instance_of Her::Collection
      notes.last.must_be_instance_of Note
      notes.last.must_respond_to :id
      notes.last.attributes.must_include "id"
      notes.last.attributes.must_include "name"
      notes.last.attributes.must_include "description"
      notes.last.attributes.must_include "created_at"
      notes.last.attributes.must_include "updated_at"

      notes = Note.all
      notes.must_be_instance_of Her::Model::Relation
      notes.last.must_be_instance_of Note
      notes.last.must_respond_to :id
      notes.last.attributes.must_include "id"
      notes.last.attributes.must_include "name"
      notes.last.attributes.must_include "description"
      notes.last.attributes.must_include "created_at"
      notes.last.attributes.must_include "updated_at"
    end

    it "CRUD for note" do
      # Create
      name,description = "nnn", "ddd"
      note = Note.create name: name, description: description
      note.wont_be_nil
      note.must_respond_to :id
      note.name.must_equal name
      note.description.must_equal description

      note_id =  note.id

      # Read
      note = Note.find note_id
      note.must_be_instance_of Note
      note.id.must_equal note_id
      note.name.must_equal name
      note.description.must_equal description

      # Update
      name_modified = "name_modified"
      note.name = name_modified
      note.save
      note.id.must_equal note_id
      note.name.must_equal name_modified
      note.description.must_equal description

      # Delete
      note.destroy
      note.destroyed?.must_equal true
      #TODO, use api to check if cannot find
    end

    it "return xxx when cannot find note" do
      #TODO
    end
  end
end
