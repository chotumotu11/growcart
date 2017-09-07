
class User < ApplicationRecord

	has_secure_password
	validates :name  , :email , :phone , :address , presence: true
	validates :email , format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i , message: "Not Valid email" }
	validates :email , :phone , uniqueness: { message: "Already Exist" }
	validates :phone , numericality: { message: "Integer Only" }
	validates :phone , length: { minimum: 8 , maximum: 10 , message: "not valid phone number"}
	has_and_belongs_to_many :items
	has_many :carts
end
