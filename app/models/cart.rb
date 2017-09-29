class Cart < ApplicationRecord
  belongs_to :user , optional: true
  belongs_to :item , optional: true

  scope :quantity , -> (id_item){ where(item_id: id_item).count }
end
