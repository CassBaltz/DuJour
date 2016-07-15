class CookingTool < ActiveRecord::Base
	belongs_to :meal
	has_attached_file :icon
	validates_attachment_content_type :icon, :content_type => %w(image/jpeg image/jpg image/png)
end
