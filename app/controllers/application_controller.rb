class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  def initialize_cart
    @cart = current_user.current_cart
    if @cart.nil?
      @cart = Cart.create
      @cart.user = current_user
      current_user.current_cart = @cart
      current_user.save
      @cart.save
    end
  end

  def current_cart
    current_user.current_cart
  end
  helper_method :current_cart
end
