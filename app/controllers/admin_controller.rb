class AdminController < ApplicationController
  def index
  	@newItem = Item.new
  end
end

