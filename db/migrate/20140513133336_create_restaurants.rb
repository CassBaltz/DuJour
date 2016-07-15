class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :website
      t.text :description
      t.integer :chef_id
      t.string :city
      t.string :state
      t.attachment :restaurant_picture

      t.timestamps
    end
  end
end
