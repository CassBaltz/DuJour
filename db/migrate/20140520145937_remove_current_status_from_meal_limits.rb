class RemoveCurrentStatusFromMealLimits < ActiveRecord::Migration
  def change
    remove_column :meal_limits, :current_status, :binary
  end
end
