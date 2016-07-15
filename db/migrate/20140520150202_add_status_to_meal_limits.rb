class AddStatusToMealLimits < ActiveRecord::Migration
  def change
    add_column :meal_limits, :status, :boolean, :default => false
  end
end
