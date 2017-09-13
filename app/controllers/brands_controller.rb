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
    subCatId = params[:brand][:subcategory]
    @subCat = Subcategory.find_by(id: subCatId)
    brand = params[:brand][:name]
    @newBrand = @subCat.brands.create(name: brand)
    @newBrand.save
    redirect_to admin_index_path
  end

  def destroy
    brandId = params[:id]
    @deleteBrand = Brand.find_by(id: brandId)
    @deleteBrand.destroy
    redirect_to admin_index_path
  end
end
