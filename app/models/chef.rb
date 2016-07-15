class Chef < ActiveRecord::Base
	has_many :meals
	has_many :restaurants
	has_attached_file :bio_photo
	validates_attachment_content_type :bio_photo, :content_type => %w(image/jpeg image/jpg image/png)
	validates :name, presence: true 
	validates :bio, presence: true
end

