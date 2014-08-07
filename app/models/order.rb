class Order < ActiveRecord::Base
  belongs_to :cart
  belongs_to :user

  # like a join between cart and user
  # order instance created when checkout happens or user logs in
  # when checkout happens, status changes
  # when checkout happens, item inventory adjusts

  def change_inventory
    self.cart.line_items.each do |line_item| 
      line_item.item.inventory -= line_item.quantity
    end 
  end
end
