class CreateMealPhotos < ActiveRecord::Migration
  def change
    create_table :meal_photos do |t|
      t.string :name
      t.integer :meal_id
      t.attachment :picture

      t.timestamps
    end
  end
end
