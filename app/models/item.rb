class Item < ApplicationRecord

  has_attached_file :avatar, styles: { medium: "300x300>" , thumb: "140x100#" }, default_url: "http://via.placeholder.com/140x100"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/	
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
