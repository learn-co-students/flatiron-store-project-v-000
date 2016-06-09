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
    @second_item = Item.second
    @second_item.order_items.create(quantity: 2, order: @order, total_line_price: @second_item.price * 2)
    @order_total = @item.price + (@second_item.price * 2)
    expect(@order.total).to eq(@order_total)
  end

  it 'can calculate its total even if item price has changed' do
    @second_item = Item.second
    @second_item.order_items.create(quantity: 1, order: @order, total_line_price: @second_item.price)
    @order_total = @item.price + @second_item.price
    @second_item.update(price: (@second_item.price+1))
    expect(@order.total).to eq(@order_total)
  end



end
