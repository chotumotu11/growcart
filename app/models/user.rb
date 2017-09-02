class User < ApplicationRecord
	has_and_belongs_to_many :items
	has_many :carts
end
