class StoreController < ApplicationController
  before_filter :initialize_cart, only: [:index]

  def index
    @items = Item.order(:title)
    @categories = Category.order(:title)
  end
  
end
