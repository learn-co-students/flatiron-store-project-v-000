class StoreController < ApplicationController

  def index
    # binding.pry
    @items = Item.order(:title)
    @categories = Category.order(:title)
  end
  
end
