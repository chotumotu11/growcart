class SubcategoriesController < ApplicationController
  def index
  	@allSubCat = Category.find_by(id: params[:cat_id]).subcategories.all
  	respond_to do |format|
  		format.json { render :json => @allSubCat }
  	end 
  end

  def new
    unless params[:category][:id]==""
      @newSubCat = Subcategory.new
      @catName =   Category.find_by(id: params[:category][:id])
      @subCatAll = @catName.subcategories.all 
      @catname = @catName[:name]
    else
      redirect_to admin_index_path
    end
  end

  def create
   catId = params[:subcategory][:category]
   subCatName = params[:subcategory][:name]
   @cat = Category.find_by(id: catId)
   @newSubCat = @cat.subcategories.create(name: subCatName)
   @newSubCat.save
   redirect_to admin_index_path
  end

  def destroy
    @delSubCat = Subcategory.find_by(id: params[:id])
    @delSubCat.destroy
    redirect_to admin_index_path
  end

end
