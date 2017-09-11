class CategoriesController < ApplicationController

  def new
    @newCat = Category.new
    @allCat = Category.all
  end

  def create
  	@createCat = Category.new(category_params)
  	if @createCat.save
  		redirect_to new_category_path 
  	else
  		redirect_to new_category_path
  	end
  end

  def destroy
  	@delCat = Category.find_by(id: params[:id])
  	@delCat.destroy
  	redirect_to new_category_path
  end

  private
  	def category_params
  		params.require(:category).permit(:name)
  	end
end

