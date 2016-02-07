class LineItemsController < ApplicationController
  before_filter :authenticate_user!
  before_action :initialize_cart, only: [:create]

  def create
    item = Item.find(params[:item_id])
    @line_item = current_cart.add_item(item.id)
    respond_to do |format|
      if @line_item.save
        format.html { redirect_to cart_path(current_cart),
        notice: 'Item added to cart!' }
      else
        redirect_to store_path
      end
    end
  end
end
