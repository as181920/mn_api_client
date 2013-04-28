module MnClient
  class Entry
    include Her::Model

    belongs_to :note
    has_many :items

    #parse_root_in_json true
    include_root_in_json true

    collection_path "notes/:note_id/entries"

    custom_post :create_with_data
    custom_get :find_with_data
    custom_get :all_data
  end
end
