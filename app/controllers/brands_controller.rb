class BrandsController < ApplicationController
  def index
  	@allbrands = Subcategory.find_by(id: params[:cat_id]).brands.all
  	respond_to do |format|
  		format.json { render :json => @allbrands }
  	end
  end

  def new
    unless params[:category] == "" || params[:subcategory] == "" 
      @cat = Category.find_by(id: params[:category])
      @subcat = Subcategory.find_by(id: params[:subcategory])
      @brands = @subcat.brands.all
      @subCatName = @subcat[:name]
      @catName = @cat[:name] 
      @newBrand = Brand.new
    else
       redirect_to admin_index_path , notice: "Please enter parameters"
    end
  end

  def create
    subCatId = params[:brand][:subcategory]
    @subCat = Subcategory.find_by(id: subCatId)
    catId = @subCat.category.id
    brand = params[:brand][:name]
    @newBrand = @subCat.brands.create(name: brand)
    @newBrand.save
    redirect_to action: "new" , subcategory: subCatId , category: catId
  end

  def destroy
    brandId = params[:id]
    @deleteBrand = Brand.find_by(id: brandId)
    subcatid = @deleteBrand.subcategory.id
    catid = @deleteBrand.subcategory.category.id
    @deleteBrand.destroy
    redirect_to action: "new" , subcategory: subcatid , category: catid
  end
end
