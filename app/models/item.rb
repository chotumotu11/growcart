class Item < ApplicationRecord
  validates :title , :price , presence: true
  validates :price , numericality: { message: "Integer Only"}
  belongs_to :brand, optional: true
  has_and_belongs_to_many :users
  has_many :carts

  def getbrand
   	Brand.find_by(id: self[:brand_id])
  end

  def getsubcategory
  	Subcategory.find_by(id: getbrand[:subcategory_id])
  end

  def getcategory
  	Category.find_by(id: getsubcategory[:category_id])
  end
end
