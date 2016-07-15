class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :meal_id
      t.integer :order_option_id
      t.integer :store_id

      t.timestamps
    end
  end
end
