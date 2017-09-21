class Subcategory < ApplicationRecord
  validates :name , presence: true
  validates_uniqueness_of :name , scope: :category_id , case_sensitive: false
  belongs_to :category , optional: true
  has_many :brands , dependent: :destroy
  has_many :items , through: :brands
end
