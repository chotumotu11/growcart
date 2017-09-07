class Subcategory < ApplicationRecord
  validates :name , presence: true , uniqueness: true
  belongs_to :category , optional: true
  has_many :brands
  has_many :items , through: :brands
end
