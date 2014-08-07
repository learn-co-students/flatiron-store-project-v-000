class CartsController < ApplicationController
  before_filter :set_cart, only: [:checkout, :show]

  def checkout
  end

  def destroy
    session[:cart_id] = nil
  end

  private
  def set_cart
    @cart = Cart.find(params[:id])
  end
end
