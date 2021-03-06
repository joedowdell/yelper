class Review < ActiveRecord::Base

	belongs_to :restaurant
	has_many :endorsements

	validates :rating, inclusion: (1..5)
	validates :restaurant_id, presence: true
	
end
