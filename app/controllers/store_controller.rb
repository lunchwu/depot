class StoreController < ApplicationController
  def index
  	@products = Product.all
	@cart = current_cart
	if session[:count].nil?
		session[:count] = 0
	else
		session[:count] += 1
	end
  end

end
