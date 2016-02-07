require 'rails_helper'

RSpec.describe Cart, :type => :model do
  before(:each) do 
    @item = Item.first
    @cart = Cart.create
    @line_item = @item.line_items.create(quantity: 1, cart: @cart)
  end

  describe 'items' do 
    it 'has many line_items built through instance method' do 
      expect(@cart.line_items).to include(@line_item)
    end

    it 'has many items through line_items' do
      expect(@cart.items).to include(@item)
    end
  end

  it 'can calculate its total' do 
    Item.second.line_items.create(quantity: 1, cart: @cart)
    expect(@cart.total).to eq(@item.price + Item.second.price)
  end


  describe "#add_item" do
    it 'creates a new unsaved line_item for new item' do
      second_item = Item.second
      second_line_item = @cart.add_item(second_item.id)
      expect(second_line_item.new_record?).to be_truthy
    end

    it 'creates an appropriate line_item' do
      second_item = Item.second
      second_line_item = @cart.add_item(second_item.id)
      expect(second_line_item.quantity).to eq(1)
      expect(second_line_item.item_id).to eq(second_item.id)
      expect(second_line_item.cart_id).to eq(@cart.id)
    end

    it 'updates existing line_item instead of making new when adding same item' do 
      @line_item2 = @cart.add_item(@item.id)
      @line_item2.save
      expect(@line_item.id).to eq(@line_item2.id)
    end
  end
end
