class UsersController < ApplicationController

	before_action :set_post , only: [:show , :edit , :update , :destroy]
  skip_before_action :ensure_login , only: [:new , :create]

	def index
		@allUsers = User.all 
	end

  def new
  	@allUser = User.new
  end

  def create
  	@createUser = User.new(user_params)

  	if @createUser.save
  		acc_type = User.find_by(email: params[:user][:email])
  		acc_type.account_type = "normal"
  		acc_type.save
  		flash[:notice]= "Succesfully Saved record"
  	else
  		flash[:notice] = "Not saved Please try again later"
  	end

  end

  def show
    @itemsBought = current_user.items.all 
  end

  def destroy
  	if @my_user.destroy
  		flash[:notice]= "Successfully deleted"
  	else
  		flash[:notice]= "Not Deleted"
  	end
  end

  private 
  	def user_params
  		params.require(:user).permit(:name,:email,:address,:phone,:password)
  	end

  	def set_post
  		@my_user = User.find_by(id: params[:id]) 
  	end
end
