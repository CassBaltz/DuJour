class OrderOption < ActiveRecord::Base
	belongs_to :meal
	has_many :ingredients
	has_many :instructions
	has_many :orders

end
