class Item < ApplicationRecord
  validates :title , :price , presence: true
  validates :price , numericality: { message: "Integer Only"}
  belongs_to :brand, optional: true
  has_and_belongs_to_many :users
  has_many :carts
end
