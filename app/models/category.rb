class Category < ApplicationRecord
	validates :name , presence: true , uniqueness: true
	has_many :subcategories
	has_many :items , through: :subcategories
end
