class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  has_many :items, through: :line_items

  def add_item(item_id)
    line_item = self.line_items.find_by(item_id: item_id) 
    if line_item 
      line_item.quantity += 1
      line_item.save
    else
      self.line_items.create(item_id: item_id)
    end
  end

  def total
    total = 0
    self.line_items.each do |line_item|
      total += line_item.item.price * line_item.quantity
    end
    return total
  end

end
