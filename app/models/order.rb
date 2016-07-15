class Order < ActiveRecord::Base
	belongs_to :meal
	belongs_to :store
	belongs_to :order_option
	belongs_to :user

	validates :meal, presence: true
	validates :store, presence: true
	validates :order_option, presence: true
	validates :user, presence: true

	validate :on_date
	validate :in_time
	validate :meal_limit_is_set
	validate :meal_is_available_for_this_store

def self.search_email(query)
  where("email like ?", "%#{query}%") 
end

def self.search_name(query)
  where("name like ?", "%#{query}%")
end


private

		def on_date
			meal = Meal.find(meal_id)
			if Date.today != meal.date
			errors.add(:meal, "this meal is not available")
			end
		end

		def in_time
			meal = Meal.find(meal_id)
			if Time.now > meal.end_time
			errors.add(:meal, "this sale is no longer running")
			end
		end

		def meal_limit_is_set
			store = Store.find(store_id)
			meal = Meal.find(meal_id)
			if store.meal_limits.find_by(meal_id: meal.id).present? != true
			errors.add(:store, "this store is not taking orders")
			end
		end

		def meal_is_available_for_this_store
			store = Store.find(store_id)
			meal = Meal.find(meal_id)
			if store.meal_limits.find_by(meal_id: meal.id).present? == true && store.meal_limits.find_by(meal_id: meal.id).status != false
			errors.add(:store, "this store doesn't have any meals left")
			end
		end

		

end
