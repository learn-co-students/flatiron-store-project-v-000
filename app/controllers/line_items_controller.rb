class LineItemsController < ApplicationController

  def create
    line_item = current_user.current_cart.add_item(params[:item_id])
    if line_item.save
      redirect_to store_path, {notice: 'Item added to cart!'}
    else
      redirect_to store_path, {notice: 'Unable to add item'}
    end
  end

end
