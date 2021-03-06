module MnClient
  class Field
    include Her::Model

    belongs_to :note
    has_many :items

    parse_root_in_json true
    include_root_in_json true

    collection_path "notes/:note_id/fields"
  end
end
