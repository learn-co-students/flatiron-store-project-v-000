class LineItemsController < ApplicationController

  def create
    current_user.current_cart.add_item(params[:id])
    redirect_to store_path
  end

end
