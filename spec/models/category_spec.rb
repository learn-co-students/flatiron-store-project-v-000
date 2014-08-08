require 'rails_helper'

RSpec.describe Category, :type => :model do

  it 'has many items' do 
    expect(Category.first.items).to include(Item.first)
  end
end
