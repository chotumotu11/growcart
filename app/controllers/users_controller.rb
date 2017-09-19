class UsersController < ApplicationController

	before_action :set_post , only: [:show , :edit , :update , :destroy]
  skip_before_action :ensure_login , only: [:new , :create]
  skip_before_action :ensure_admin , only: [:new , :create , :show ]

	def index
		@allUsers = User.all 
	end

  def new
    if session[:user_id] && current_user.account_type != "admin"
      redirect_to root_path
    end
  	@allUser = User.new

  end

  def create
  	@createUser = User.new(user_params)

  	if @createUser.save
  		acc_type = User.find_by(email: params[:user][:email])
  		acc_type.account_type = "normal"
  		acc_type.save
  		session[:user_id] = acc_type.id
      redirect_to root_path , notice: "logged in successfully"

  	else
  		flash[:notice] = "Not saved Please try again later"
      redirect_to new_user_path
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
