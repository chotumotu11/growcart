class SessionsController < ApplicationController
  def new
  end

  def create
  	myUser = User.find_by(email: params[:user][:email])
	pass = params[:user][:password]

	if myUser && myUser.authenticate(pass)
		session[:user_id] = myUser.id
		redirect_to root_path , notice: "logged in successfully"
	else
		redirect_to login_path , notice: "Invalid password/email"
	end
  end

  def destroy
  	reset_session
  	redirect_to login_path , notice: "You have been logged out successfully"
  end
end
