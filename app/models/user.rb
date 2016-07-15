class User < ActiveRecord::Base
	before_save { self.email.downcase! }
	before_create :create_remember_token
	validates :name, presence: true, length: { :maximum => 50 }
	validates :zip, presence: true, length: {:is => 5}, numericality: { only_integer: true }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }
	has_many :relationships, dependent: :destroy
	has_many :stores, through: :relationships
	has_many :orders
	has_many :stores, through: :orders

def send_password_recovery
  self.password_recovery_token = SecureRandom.urlsafe_base64
  self.password_recovery_sent_at = Time.zone.now
  self.save!(validate: false)
  UserMailer.password_recovery(self).deliver
end

def stores_nearby
	Store.near(user_location)
end

def user_location
	self.zip.to_latlon
end

def User.new_remember_token
	SecureRandom.urlsafe_base64
end

def save_store!(store)
	create_relationship!(store_id: store.id)
end

private

	def create_remember_token
		self.remember_token = Digest::SHA1.hexdigest(User.new_remember_token.to_s)
	end	

	def current_admin
  		current_user && current_user.is_admin
	end
end		