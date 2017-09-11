class BrandsController < ApplicationController
  def index
  	@allbrands = Subcategory.find_by(id: params[:cat_id]).brands.all
  	respond_to do |format|
  		format.json { render :json => @allbrands }
  	end
  end

  def new
    @cat = Category.find_by(id: params[:category])
    @subcat = Subcategory.find_by(id: params[:subcategory])
    @brands = @subcat.brands.all
    @subCatName = @subcat[:name]
    @catName = @cat[:name] 
    @newBrand = Brand.new
  end

  def create
  end

  def destroy
  end
end
