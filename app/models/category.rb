class Category < ApplicationRecord
	validates :name , presence: true , uniqueness: true
	has_many :subcategories , dependent: :destroy
	has_many :items , through: :subcategories
end
