class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :store_id
      t.integer :user_id

      t.timestamps
    end
    add_index :relationships, :store_id
    add_index :relationships, :user_id
    add_index :relationships, [:user_id, :store_id], unique: true
  end
end
