class Ingredient < ActiveRecord::Base
	belongs_to :order_option
end
