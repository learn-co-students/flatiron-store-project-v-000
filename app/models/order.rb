class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items

  def total
    order_items.inject(0) do |sum, order_item|
      sum + order_item.total_line_price
    end
  end

end
