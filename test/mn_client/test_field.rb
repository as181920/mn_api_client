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
      name = "field_a"
      #binding.pry
      #field = @note.fields

    end
  end
end

=begin
    it "can CRUD fields for one note" do
      name = "name_for_field"
      field = @note.fields.create name: name
      @note.fields.count.must_equal 1
      field.name.must_equal name
      @note.fields.create name: "another field"
      @note.fields.count.must_equal 2

      field = @note.fields.find field.id
      field.wont_be_nil

      name_modified = "name_modified"
      field.name = name_modified
      field.save
      field.name.must_equal name_modified
      field.name = name
      @note.save
      field.name.must_equal name
      field.name = name

      field.destroy
      proc {@note.fields.find(field.id)}.must_raise ActiveRecord::RecordNotFound
      @note.fields.count.must_equal 1
      @note.fields.destroy_all
      @note.fields.must_be_empty
    end

    it "name should not empty" do
      proc {@note.fields.create!}.must_raise ActiveRecord::RecordInvalid
      field = @note.fields.create
      field.valid?.must_equal false
    end
=end
