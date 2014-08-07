class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  has_many :items, through: :line_items

  def add_item(item_id)
    current_item = line_items.find_by(item_id: item_id) 
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(item_id: item_id)
    end
    current_item
  end

  def total
    total = 0
    self.line_items.each do |line_item|
      total += line_item.item.price
    end
    return total
  end

end
