class ItemsController < ApplicationController
	before_action :set_post , only: [:show , :edit , :update , :destroy]
  def index
  	@test = params[:category]
  	@test2 = params[:subcategory]
  	@test3 = params[:brand]
  	@all_items = Item.all.order(id: :desc) if @test.nil?  || @test==""
  	@cat = Category.find(@test) unless @test.nil? || @test==""
  	@all_items = @cat.items unless @test.nil? || @test==""

  	@subcat = @cat.subcategories.find_by(id: @test2) unless @test2.nil? || @test2=="" 	
  	@all_items = @subcat.items unless @test2.nil? || @test2=="" || @subcat == nil

  	@brand = @subcat.brands.find_by(id: @test3) unless @test3.nil? || @test3=="" || @subcat == nil
  	@all_items = @brand.items unless @brand == nil

    @userName = User.find_by(id: session[:user_id])
    

  	respond_to do |format|
  		format.html
  		format.json
  		format.js 
  	end
  end

  def show

  end

  private
  	def set_post
  		@my_item = Item.find(params[:id]) 
  	end 
end
