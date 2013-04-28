module MnClient
  class Note
    include Her::Model
    parse_root_in_json true
    include_root_in_json true

    has_many :fields
    has_many :entries
  end
end
