class ChangeDefaultForCurrentOrdersMealLimits < ActiveRecord::Migration
  def change
  	change_column :meal_limits, :current_orders, :integer, :default => 0
  end
end
