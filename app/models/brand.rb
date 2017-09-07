class Brand < ApplicationRecord
  validates :name , presence: true 
  belongs_to :subcategory , optional: true
  has_many :items
end
