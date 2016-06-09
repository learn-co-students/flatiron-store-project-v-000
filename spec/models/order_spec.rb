require 'rails_helper'

RSpec.describe Order, :type => :model do
  before(:each) do
    @user = User.first
    @item = Item.first
    @order = @user.orders.create
    @order_item = @item.order_items.create(quantity: 1, order: @order, total_line_price: @item.price)
  end

  describe 'items' do
    it 'has many order_items built through instance method' do
      expect(@order.order_items).to include(@order_item)
    end

    it 'has many items through line_items' do
      expect(@order.items).to include(@item)
    end
  end

  it 'can calculate its total' do
    Item.second.order_items.create(quantity: 2, order: @order, total_line_price: @item.price * 2)
    expect(@order.total).to eq(@item.price + Item.second.price * 2)
  end

  it 'can calculate its total even if item price has changed' do
    @second_item = Item.second
    @second_item.order_items.create(quantity: 1, order: @order, total_line_price: @item.price)
    @second_item.update(price: (@second_item.price+1))
    expect(@order.total).to eq(@item.price + @second_item.price + 1)
  end



end
