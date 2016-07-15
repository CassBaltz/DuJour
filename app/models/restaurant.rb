class Restaurant < ActiveRecord::Base
	belongs_to :chef
	has_attached_file :restaurant_picture
	validates_attachment_content_type :restaurant_picture, :content_type => %w(image/jpeg image/jpg image/png)
end
