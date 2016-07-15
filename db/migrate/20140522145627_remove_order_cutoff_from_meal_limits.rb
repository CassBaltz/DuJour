class RemoveOrderCutoffFromMealLimits < ActiveRecord::Migration
  def change
    remove_column :meal_limits, :order_cutoff, :time
  end
end
