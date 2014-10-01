class CartsController < ApplicationController
  before_filter :set_cart, only: [:checkout, :show]

  def show
  end

  def checkout
    @order = Order.create_from_cart(@cart)
    @order.change_order_status
    @order.change_inventory
    session[:cart_id] = nil
    respond_to do |format|
      format.html { redirect_to order_path(@order), notice: 'Thanks for your order!' }
    end
  end

  private
  def set_cart
    @cart = Cart.find(params[:id])
  end
end
