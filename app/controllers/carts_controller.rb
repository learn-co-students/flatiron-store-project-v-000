class CartsController < ApplicationController

  def show
    @cart = Cart.find(params[:id])
  end

  def checkout
    cart = Cart.find params[:id]
    cart.checkout
    # binding.pry
    redirect_to cart_path(cart)
  end

end
