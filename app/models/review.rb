class Review < ActiveRecord::Base

	belongs_to :restaurant
	validates :rating, inclusion: (1..5)
	validates :restaurant_id, presence: true
end
