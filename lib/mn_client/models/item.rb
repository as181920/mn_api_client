class Item
  include Her::Model

  belongs_to :field
  belongs_to :entry
end
