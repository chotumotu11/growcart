class Subcategory < ApplicationRecord
  validates :name , presence: true
  belongs_to :category , optional: true
  has_many :brands , dependent: :destroy
  has_many :items , through: :brands
end
