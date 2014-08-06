class CartsController < ApplicationController
  before_filter :set_cart, only: [:checkout, :show]

  def checkout
    @cart.create_order
    @cart.change_inventory
  end

  def destroy
    session[:cart_id] = nil
  end

  private
  def set_cart
    @cart = Cart.find(params[:id])
  end
end
