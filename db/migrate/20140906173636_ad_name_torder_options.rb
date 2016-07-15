class AdNameTorderOptions < ActiveRecord::Migration
  def change
  	add_column :order_options, :name, :string
  end
end
