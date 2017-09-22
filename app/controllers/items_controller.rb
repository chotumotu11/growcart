class ItemsController < ApplicationController
	before_action :set_post , only: [:show , :edit , :update , :destroy]
  skip_before_action :ensure_login , only: [:index , :show]
  skip_before_action :ensure_admin , only: [:index, :show]
  
  def index
  	@test = params[:category]
  	@test2 = params[:subcategory]
  	@test3 = params[:brand]
  	@all_items = Item.all.order(id: :desc) if @test.nil?  || @test==""
    
    unless @test.nil? || @test==""
    	@cat = Category.find(@test) 
    	@all_items = @cat.items 
    end

  	@subcat = @cat.subcategories.find_by(id: @test2) unless @test2.nil? || @test2=="" 	
  	@all_items = @subcat.items unless @subcat == nil

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
    @av = params[:avatar]
    if @title=="" || @price=="" || @desc=="" || @av.nil? || params[:category]=="" || params[:subcategory]=="" || params[:brand]==""
      redirect_to new_item_path , alert: "fields cannot be empty"
    else
      @category = Category.find_by(id: params[:category])
      @subcat = @category.subcategories.find_by(id: params[:subcategory])
      @brand = @subcat.brands.find_by(id: params[:brand])
      @newItem =  @brand.items.create title: @title , price: @price , description: @desc , avatar: @av
      if @newItem.save 
        redirect_to admin_index_path , notice: "Success for new item"
      else
        redirect_to admin_index_path , notice: "Not Success for new item"
      end    
    end

  end

  def show
    @userName = User.find_by(id: session[:user_id])
  end

  def edit
  end

  def update
    @cat = Category.find_by(id: params[:category])
    @subcat = Subcategory.find_by(id: params[:subcategory])
    @newBrand = Brand.find_by(id: params[:brand])

    item_name = params[:item][:title]
    item_price = params[:item][:price]
    item_description = params[:item][:description]

    @item = Item.find_by(id: params[:id])
    @av = params[:item][:avatar]
    if item_name=="" || item_price=="" || item_description==""
      redirect_to edit_item_path(params[:id]) , notice: "Fields Cannot be empty"
    else
      @oldBrand = @item.getbrand
      @item.update(title: item_name, price: item_price , description: item_description)
      unless @av.nil?
        @item.update(avatar: @av)
      end
      @oldBrand.items.delete(@item) unless @oldBrand.nil?
      @updateItem = Item.find_by(id: params[:id])
      @newBrand.items << @updateItem
      redirect_to root_path
    end
  end

  def destroy
    itemToDelete = Item.find_by(id: params[:id])
    itemToDelete.destroy
    redirect_to root_path
  end
  private
  	def set_post
  		@my_item = Item.find(params[:id]) 
  	end 


end
