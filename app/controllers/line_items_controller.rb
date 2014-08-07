class LineItemsController < ApplicationController

  def create
    @item = Item.find(params[:item_id])
    @line_item = current_cart.line_items.build(item: @item)
    @line_item.quantity = 1
    if @line_item.save
      redirect_to cart_path(current_cart)
    else
      redirect_to store_path
    end
  end
end
