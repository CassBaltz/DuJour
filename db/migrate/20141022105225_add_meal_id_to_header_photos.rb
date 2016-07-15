class AddMealIdToHeaderPhotos < ActiveRecord::Migration
  def change
    add_column :header_photos, :meal_id, :integer
  end
end
