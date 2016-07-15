class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :email
      t.string :name
      t.string :password_digest
      t.string :remember_token
      t.string :street
      t.string :street_alt
      t.string :city
      t.string :state
      t.integer :zip

      t.timestamps
    end
  end
end
