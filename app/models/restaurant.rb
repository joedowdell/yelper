class Restaurant < ActiveRecord::Base
	
	has_many :reviews, dependent: :destroy
	has_many :endorsements, dependent: :destroy
	validates :name, length: { minimum: 3 }, format: { with: /\A[A-Z]/, message: 'has to begin with a capital letter' }, uniqueness: true

	def average_rating
		return 'N/A' if reviews.none?
		reviews.average(:rating)
	end

end
