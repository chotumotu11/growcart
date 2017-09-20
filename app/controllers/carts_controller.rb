class CartsController < ApplicationController

  skip_before_action :ensure_admin

  def index
  end

  def create
  	@itemNumber = params[:format]
  	@cartItem = Cart.new
  	@cartItem.save
  	@theItem = Item.find_by(id: @itemNumber)
  	@theItem.carts << @cartItem
  	current_user.carts << @cartItem
  	redirect_to carts_path
  end

  def update
  	itemsInCartOfUser = Cart.where(user_id: current_user.id)
  	itemToDelete = itemsInCartOfUser.find_by(item_id: params[:id])
  	itemToDelete.destroy
  	redirect_to carts_path
  end

  def destroy
  	itemsToBuy = current_user.my_cart_items
  	itemIds = itemsToBuy.pluck :id
  	current_user.carts.destroy_all
  	current_user.items << itemsToBuy
  	redirect_to user_path(current_user.id)
  end
end
