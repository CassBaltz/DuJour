class Store < ActiveRecord::Base
before_save { self.email.downcase! }
	before_create :create_remember_token
	validates(:name, presence: true, length: { :maximum => 50 })
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
	has_secure_password
	validates :password, length: { minimum: 6 }
	validates :street, presence: true
	validates :city, presence: true
	validates :state, presence: true, length: { is: 2 }
	validates :zip, presence:true, length: { is: 5 }, numericality: { only_integer: true }
	
	geocoded_by :full_store_address, :if => :street_changed?
	after_validation :geocode 

	has_many :relationships
	has_many :users, through: :relationships

	has_many :meal_limits
	has_many :meals, through: :meal_limits



def full_store_address
	"#{self.street}, #{self.street_alt}, #{self.city}, #{self.state}, #{self.zip}"
end

def Store.new_remember_token
	SecureRandom.urlsafe_base64
end

def save_meal_limit!(params)
	self.meal_limits.create!(params)
end

def remove!(meal_limit)
	meal_limits.find_by(meal_limit_id: meal_limit.id).destroy
end

def meal_limit_set?(meal)
	meal_limits.find_by(meal_id: meal.id)
end

private

	def create_remember_token
		self.remember_token = Digest::SHA1.hexdigest(Store.new_remember_token.to_s)
	end	
end
