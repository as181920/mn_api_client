class Entry
  include Her::Model

  belongs_to :note
  has_many :items

  collection_path "notes/:note_id/entries"
end
