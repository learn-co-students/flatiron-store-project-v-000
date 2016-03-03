# == Schema Information
#
# Table name: carts
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  status     :string           default("not submitted")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cart < ActiveRecord::Base

  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user

  # attr_accessor :status

  def add_item(item_id)
    if item_ids.include?(item_id.to_i)
      current_line_item = line_items.find_by(item_id: item_id)
      current_line_item.quantity += 1
      current_line_item
    else
      line_items.build(item_id: item_id)
    end
  end

  def total
    line_items.inject(0) { |sum, line_item| sum + line_item.total}
  end

  def checkout
    remove_inventory
    user.remove_cart
    self.status = 'submitted'
    save
  end

  private

  def remove_inventory
    line_items.each do |line_item|
      line_item.item.remove(line_item.quantity)
    end
  end

end
