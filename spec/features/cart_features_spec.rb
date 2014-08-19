require_relative "../rails_helper.rb"

describe 'Feature Test: Cart Session', :type => :feature do
  before do
    visit "/"
    first('.button_to').click_on("Add to Cart")
    @cart = Cart.find(page.get_rack_session_key('cart_id'))
    visit "/"
  end

  it 'adds one item to cart' do
    expect(page.get_rack_session_key('cart_id')).to_not be_nil
    expect(@cart.line_items.first.quantity).to eq(1)
  end

  it 'adds two items to the cart' do
    page.all(:css, '.button_to').last.click_on("Add to Cart")
    expect(@cart.line_items.count).to eq(2)
  end

  it 'adds four items to the cart' do
    2.times do
      page.all(:css, '.button_to').sample.click_on("Add to Cart")
      visit "/"
    end
    expect(@cart.line_items.count).to be_within(1).of(3)
  end

  it 'adds multiple quantities of the same item to the cart' do
    first('.button_to').click_on("Add to Cart")
    expect(@cart.line_items.count).to eq(1)
    expect(@cart.line_items.first.quantity).to eq(2)
  end

  it 'removes the cart id upon checkout' do
    page.all(:css, '.button_to').sample.click_on("Add to Cart")
    first('.button_to').click_on("Checkout")
    expect { page.get_rack_session_key('cart_id') }.to raise_error
  end

  it "updates the item's inventory upon checkout" do
    original_inventory = @cart.items.first.inventory
    item_id = @cart.items.first.id
    visit "carts/#{@cart.id}"
    first('.button_to').click_on("Checkout")
    expect(Item.find(item_id).inventory).to eq(original_inventory - 1)
  end

end