class Meal < ActiveRecord::Base
	belongs_to :chef
	has_many :meal_photos
	has_one :header_photo
	has_many :cooking_tools
	has_many :order_options
	has_many :ingredients, through: :order_options
	has_many :instructions, through: :order_options
	has_many :orders

	has_many :meal_limits
	has_many :stores, through: :meal_limits
	
	scope :editable, lambda { where("date > ?", Date.today) }
	scope :active, lambda { where("date = ?", Date.today) }
	scope :past, lambda { where("date < ?", Date.today) }

end
