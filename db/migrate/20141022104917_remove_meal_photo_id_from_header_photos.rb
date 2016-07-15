class RemoveMealPhotoIdFromHeaderPhotos < ActiveRecord::Migration
  def change
    remove_column :header_photos, :meal_photo_id, :integer
  end
end
