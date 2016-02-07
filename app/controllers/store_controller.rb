class StoreController < ApplicationController

  def index
    # binding.pry
    @items = Item.available_items.order(:title)
    @categories = Category.order(:title)
  end
  
end
