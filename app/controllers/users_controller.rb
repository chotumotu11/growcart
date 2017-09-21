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
  	
    @user = User.new

  end

  def edit
  end

  def update
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		acc_type = User.find_by(email: params[:user][:email])
  		acc_type.account_type = "normal"
  		acc_type.save
      if current_user && current_user.account_type=="admin"
        redirect_to admin_index_path , notice: "New user created successfully"
      else
  		  session[:user_id] = acc_type.id
        redirect_to root_path , notice: "logged in successfully"
      end

  	else
  		render :new
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
