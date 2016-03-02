class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :item_id
      t.integer :cart_id
      t.integer :quantity, default: 0

      t.timestamps null: false
    end
  end
end
