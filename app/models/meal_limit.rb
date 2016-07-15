class MealLimit < ActiveRecord::Base
	belongs_to :meal
	belongs_to :store
	validates :store_id, presence: true
	validates :meal_id, presence: true
	validates :availability, presence: true
	validates :current_orders, presence: true

	scope :meal_available, lambda { where("availability > current_orders") }
	scope :meal_not_available, lambda { where("availability <= current_orders") }
end
