class EndorsementsController < ApplicationController

	def create
		@review = Review.find(params[:review_id])
		@review.endorsements.create

		render json: { new_endorsements.count }
	end

end
