class CreateHeaderPhotos < ActiveRecord::Migration
  def change
    create_table :header_photos do |t|

      t.string :name
      t.integer :meal_photo_id
      t.attachment :picture

      t.timestamps
    end
  end
end
