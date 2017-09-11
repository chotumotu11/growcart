class ItemsController < ApplicationController
	before_action :set_post , only: [:show , :edit , :update , :destroy]
  skip_before_action :ensure_login , only: [:index , :show]
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

  def new
  end
  
  def create
    @title = params[:title]
    @price = params[:price]
    @desc = params[:description]
    @category = Category.find_by(id: params[:category])
    @subcat = @category.subcategories.find_by(id: params[:subcategory])
    @brand = @subcat.brands.find_by(id: params[:brand])
    @newItem =  @brand.items.create title: @title , price: @price , description: @desc
    if @newItem.save 
      redirect_to admin_index_path , notice: "Success for new item"
    else
      redirect_to admin_index_path , notice: "Not Success for new item"
    end    


  end

  def show
    @userName = User.find_by(id: session[:user_id])
  end

  private
  	def set_post
  		@my_item = Item.find(params[:id]) 
  	end 
end
