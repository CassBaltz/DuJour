class Relationship < ActiveRecord::Base
	belongs_to :store
	belongs_to :user
	validates :store_id, presence: true
	validates :user_id, presence: true

	scope :my_current_store, lambda { order("created_at DESC").first }

end
