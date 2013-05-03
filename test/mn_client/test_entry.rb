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

    it "can create entries with data for a note and get it back" do
      field_1_content,field_2_content = "c1","c2"

      # Create
      entry = Entry.create_with_data _note_id: @note.id, "data" => {@field_1_name => field_1_content, @field_2_name => field_2_content}
      entry.wont_be_nil
      entry.must_be_instance_of Entry
      entry.send(@field_1_name.to_sym).must_equal field_1_content
      entry.send(@field_2_name.to_sym).must_equal field_2_content

      # Read: get entry with data by entry_id
      entry_id = entry.id
      entry = Entry.find_with_data _note_id: @note.id, entry_id: entry_id
      entry.wont_be_nil
      entry.must_be_instance_of Entry
      entry.send(@field_1_name.to_sym).must_equal field_1_content
      entry.send(@field_2_name.to_sym).must_equal field_2_content

      # Read: get all entries with data for a note
      entries = Entry.all_data _note_id: @note.id
      entries.must_be_instance_of Her::Collection
      entries.first.send(@field_1_name.to_sym).must_equal field_1_content
      entries.first.send(@field_2_name.to_sym).must_equal field_2_content
      entries.first.note_id.must_equal @note.id
      entries.first.entry_id.must_equal entry_id

      # Update: update entry data
      field_1_content_modified,field_2_content_modified = "c11","c22"
      binding.pry
      entry = Entry.update_with_data _note_id: @note.id, entry_id: entry_id, "data" => {@field_1_name => field_1_content_modified}
      entry.wont_be_nil
      entry.must_be_instance_of Entry
      entry.send(@field_1_name.to_sym).must_equal field_1_content_modified
      entry.send(@field_2_name.to_sym).must_equal field_2_content
    end

  end
end

