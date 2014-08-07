class Order < ActiveRecord::Base
  belongs_to :cart
  belongs_to :user
  has_many :items, through: :cart

  # like a join between cart and user
  # order instance created when checkout happens or user logs in
  # when checkout happens, status changes
  # when checkout happens, item inventory adjusts

  def self.create_from_cart(cart)
    self.create(
      cart_id: cart.id
    )
  end

  def change_order_status
    self.update(status: "submitted") 
  end

  def change_inventory
    if self.status = "submitted"
      self.cart.line_items.each do |line_item| 
        line_item.item.inventory -= line_item.quantity
        line_item.item.save
      end
    end 
  end

end
