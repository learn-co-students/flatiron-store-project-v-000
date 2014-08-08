require 'rails_helper'

RSpec.describe Order, :type => :model do
  before do 
    @cart = Cart.first
    @order = Order.create_from_cart(@cart)
    @item = Item.first
    @line_item = @cart.add_item(@item.id)
    @line_item.save
    @order.change_order_status
  end

  it 'is created from a cart' do 
    expect(@order.id).to eq (@cart.id)
  end

  it 'belongs to a cart' do 
    expect(@order.cart).to eq (@cart)
  end

  it 'has many items through cart' do 
    expect(@order.items).to include(@item)
  end

  it 'has a status that changes when placed' do 
    expect(@order.status).to eq("submitted")
  end

  it 'changes the inventory of an item when placed' do 
    old_inventory = @item.inventory
    @order.change_inventory
    expect(@order.cart.line_items.first.item.inventory).to eq(old_inventory - 1)
  end
end
