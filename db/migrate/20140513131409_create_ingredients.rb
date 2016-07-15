class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.decimal :measurement_quantity
      t.string :measurement_type
      t.integer :order_option_id

      t.timestamps
    end
  end
end
