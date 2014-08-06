class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items

end
