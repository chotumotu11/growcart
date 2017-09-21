class Brand < ApplicationRecord
  validates :name , presence: true
  validates_uniqueness_of :name , scope: :subcategory_id , case_sensitive: false
  belongs_to :subcategory , optional: true
  has_many :items , dependent: :nullify
end
