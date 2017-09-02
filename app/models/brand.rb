class Brand < ApplicationRecord
  belongs_to :subcategory, optional: true
  has_many :items
end
