class CreateChefs < ActiveRecord::Migration
  def change
    create_table :chefs do |t|
      t.attachment :bio_photo
      t.string :name
      t.text :bio

      t.timestamps
    end
  end
end
