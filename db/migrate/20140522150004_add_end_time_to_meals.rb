class AddEndTimeToMeals < ActiveRecord::Migration
  def change
    add_column :meals, :end_time, :datetime
  end
end
