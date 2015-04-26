class ReviewsController < ApplicationController
	def new
		@business = Business.find(params[:business_id])
		@review = @business.reviews.new
	end

	def create
		@business = Business.find(params[:business_id])
		@review = @business.reviews.new(review_params)
		@review.user_id = current_user.id

		if @review.save
			redirect_to business_path(@business)
		else
			render business_path(@business)
		end
	end

	private
		def review_params
			params.require(:review).permit(:body, :rating, :title)
		end
end
