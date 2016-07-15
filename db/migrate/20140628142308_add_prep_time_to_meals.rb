class AddPrepTimeToMeals < ActiveRecord::Migration
  def change
  	add_column :meals, :prep_time, :string
  end
end
