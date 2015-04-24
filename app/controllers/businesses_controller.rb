class BusinessesController < ApplicationController
	def index
		@businesses = Business.all
	end

	def new
		@business = Business.new
	end

	def create
		@business = Business.new(business_params)

		if @business.save
			flash[:success] = "You've successfully added your business."
			redirect_to('/')
		else
			flash[:failure] = "Something went wrong. Your business wasn't created."
			redirect_to('/')
		end
	end

	def show
		# Google Maps API
		url = "https://maps.googleapis.com/maps/api/js?key="
  	key = ENV['GOOGLE_MAPS']
  	@endpoint = url + key

		@business = Business.find(params[:id])
		@review = @business.reviews.new
		@photo = @business.photos.new
		@user = User.find_by_id(@business.reviews)
	end

	def edit
		@business = Business.find(params[:id])
	end

	def update
		@user = User.find(params[:id])

		if @user.update_attributes(userprofile_params)
			redirect_to('/')
		else
			render edit
		end
	end

	private
		def business_params
			params.require(:business).permit(:name, :address, :address_2, :city, :state, :zip, :phone)
		end

		def userprofile_params
			params.require(:user).permit(:first_name, :last_name, :email, :username, :location, :hometown, :nickname, :photo, :headline, :website, :password, :password_confirmation)
		end
end
