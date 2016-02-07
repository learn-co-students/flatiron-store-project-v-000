require 'rails_helper'

RSpec.describe Item, :type => :model do
  before do
    @item = Item.first
    Category.first.items << @item
  end

  it 'belongs to a category' do 
    expect(@item.category).to eq(Category.first)
  end

  describe 'with line_items' do 
    before do 
      @item = Item.first
      @cart = Cart.create
      @line_item = @item.line_items.create(quantity: 1, cart: @cart)
    end

    it 'has many line_items consolidated by line_item quantity' do 
      expect(@item.line_items.first.quantity).to eq(1)
    end
  end

  describe ".available_items" do
    before(:each) do
      @item = Item.first
      @item.inventory=0
      @item.save
    end
    it "only returns items with inventory" do
      expect(Item.available_items).to_not include(Item.first)
      expect(Item.available_items.count).to eq(9)
    end
  end
end
