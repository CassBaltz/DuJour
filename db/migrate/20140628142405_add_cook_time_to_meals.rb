class AddCookTimeToMeals < ActiveRecord::Migration
  def change
  	add_column :meals, :cook_time, :string
  end
end
