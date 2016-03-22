class StoreController < ApplicationController
  
  def index
  	@categories = Category.all
  	@items = Item.available_items
  end

end
