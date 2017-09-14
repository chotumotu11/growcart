class AdminController < ApplicationController
  def index
  	@newItem = Item.new
  end

  def update
  	if current_user && current_user[:name] == "admin"
  		pass = params[:oldpassword]
  		if current_user.authenticate(pass)
  			newpass = params[:user][:password]
  			current_user.update(password: newpass)
  			redirect_to admin_index_path , notice: "Password changed successfully"
  		else
  			redirect_to admin_index_path , notice: "Password not changed"
  		end
  	end
  end
end

