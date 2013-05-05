require "helper"

describe MnClient do
  before  do
    @note = Note.create name: "n_name", description: "d_description"
  end

  describe "CRUD for Field" do
    it "have no fields for default" do
      fields = @note.fields
      fields.size.must_equal 0
    end

    it "CRUD fields for one note" do
      # Create
      name = "field_a"
      field = @note.fields.create name: name
      field.wont_be_nil
      field.must_be_instance_of Field
      field.must_respond_to :id
      field.name.must_equal name

      id = field.id

      # Read
      field = Field.find id, _note_id: @note.id
      field.wont_be_nil
      field.must_be_instance_of Field
      field.name.must_equal name

      # Update
      name_modified = "field_a_modified"
      field.name = name_modified
      field.save
      field.new?.must_equal false
      field.id.must_equal id
      field.name.must_equal name_modified

      # Delete
      field.destroy
      field.destroyed?.must_equal true
      #TODO: find use api to check if cannot find anymore
    end

    it "return nil when cannot find field" do
      #TODO
    end
  end
end

