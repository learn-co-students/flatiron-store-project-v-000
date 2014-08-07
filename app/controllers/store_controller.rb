class StoreController < ApplicationController

  def index
    @items = Item.order(:title)
    @categories = Category.order(:title)
  end
  
end
