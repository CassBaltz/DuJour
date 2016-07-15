class AddIndexToMealLimits < ActiveRecord::Migration
  def change 
  	add_index :meal_limits, [:store_id, :meal_id], unique: true
  end
end
