class Item < ApplicationRecord
  belongs_to :brand, optional: true
  has_and_belongs_to_many :users
  has_many :carts
end
