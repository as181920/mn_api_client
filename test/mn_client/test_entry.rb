require "helper"

describe MnClient do
  before  do
    @note_name,@field_1_name,@field_2_name = "n_name", "field_1", "field_2"
    @note = Note.create name: @note_name, description: "d_description"
    @field_1 = @note.fields.create name: @field_1_name
    @field_2 = @note.fields.create name: @field_2_name
  end

  describe "CRUD for Entry" do
    it "one note have no entries by default" do
      @note.entries.size.must_equal 0
    end

    it "can create entries with data for a note and get them back" do
      field_1_content,field_2_content = "c1","c2"
      entry = Entry.create_with_data _note_id: @note.id, "data" => {@field_1_name => field_1_content, @field_2_name => field_2_content}
      entry.wont_be_nil
      entry.must_be_instance_of Entry
      entry.send(@field_1_name.to_sym).must_equal field_1_content
      entry.send(@field_2_name.to_sym).must_equal field_2_content
    end
  end
end

