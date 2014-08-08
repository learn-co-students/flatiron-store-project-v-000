require 'rails_helper'

RSpec.describe LineItem, :type => :model do
  before do 
    @item = Item.first
    @line_item = Cart.first.add_item(@item.id)
    @line_item.save
  end

  it 'belongs to a cart' do 
    expect(@line_item.cart).to eq(Cart.first)
  end

  it 'belongs to an item' do 
    expect(@line_item.item).to eq (@item)
  end

  it 'has a quantity, default 1' do 
    expect(@line_item.quantity).to eq(1)
  end
end
