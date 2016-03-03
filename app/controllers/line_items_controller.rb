class LineItemsController < ApplicationController

  def create
    new_item = current_user.current_cart.add_item(params[:id])
    new_item.save
    redirect_to store_path
  end

end
