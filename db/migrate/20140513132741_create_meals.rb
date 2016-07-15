class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.string :name
      t.text :description
      t.date :date
      t.integer :chef_id

      t.timestamps
    end
  end
end
