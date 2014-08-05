class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def create_order
    @order ||= Order.new
    @order.user = self.user
    @order.items = self.items
    @order.save
  end

  def change_inventory
    
  end
end
