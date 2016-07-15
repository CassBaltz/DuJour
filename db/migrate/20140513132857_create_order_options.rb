class CreateOrderOptions < ActiveRecord::Migration
  def change
    create_table :order_options do |t|
      t.string :size
      t.string :feeds
      t.decimal :price
      t.integer :meal_id

      t.timestamps
    end
  end
end
