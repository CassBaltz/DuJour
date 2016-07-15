class CreateMealLimits < ActiveRecord::Migration
  def change
    create_table :meal_limits do |t|
      t.integer :meal_id
      t.integer :store_id
      t.datetime :order_cutoff
      t.integer :availability
      t.integer :current_orders
      t.binary :current_status

      t.timestamps
    end
  end
end
