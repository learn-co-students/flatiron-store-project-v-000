require 'rails_helper'

RSpec.describe Cart, :type => :model do
  before do 
    @item = Item.first
    @line_item = Cart.first.add_item(@item.id)
    @line_item.save
  end

  context 'items' do 
    it 'has many line_items built through instance method' do 
      expect(Cart.first.line_items).to include(@line_item)
    end

    it 'has many items through line_items' do
      expect(Cart.first.items).to include(@item)
    end
  end

  it 'can calculate its total' do 
    expect(Cart.first.total).to eq(Cart.first.items.first.price)
  end

  it 'consolidates multiple same line_items in add_item method' do 
    Cart.first.add_item(@item.id)
    expect(Cart.first.line_items.first.quantity).to eq(2)
  end
end
