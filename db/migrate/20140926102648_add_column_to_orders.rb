class AddColumnToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :ready_for_pickup, :boolean, :default => false
  end
end
