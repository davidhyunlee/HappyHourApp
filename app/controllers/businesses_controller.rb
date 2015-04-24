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
		@photo = @business.photos.new

		@user = User.find_by_id(@business.reviews)
	end

	def edit
		@business = Business.find(params[:id])
		# @hours = Hour.new unless Hour.exists?(business_id: @business.id) do Hour.new end
		@hours = if Hour.exists?(business_id: @business.id) do Hour.find_by_business_id(@business.id) else Hour.new end
	end

	def update
	end

	private
		def business_params
			params.require(:business).permit(:name, :address, :address_2, :city, :state, :zip, :phone)
		end
end
