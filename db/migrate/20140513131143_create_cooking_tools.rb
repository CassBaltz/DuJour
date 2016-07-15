class CreateCookingTools < ActiveRecord::Migration
  def change
    create_table :cooking_tools do |t|
      t.string :name
      t.attachment :icon
      t.integer :meal_id

      t.timestamps
    end
  end
end
