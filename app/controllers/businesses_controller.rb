class BusinessesController < ApplicationController

	before_action :require_user, only: [:contact, :help]
	before_action :require_admin, only: [:new, :create, :edit]

	def index
		# @businesses = Business.all

  	if params[:query] && params[:filter]
  		search_by = params[:filter].to_sym
		query = params[:query]
		@businesses = Business.where(search_by => query).page(params[:page])
   	else
    	@businesses = Business.order(:name).page(params[:page])
    end		
	end

	def new
		@business = Business.new
	end

	def create
		@business = Business.new(business_params)

		if @business.save
			flash[:success] = "You've successfully added your business."
			redirect_to edit_business_path(@business.id)
		else
			flash[:failure] = "Something went wrong. Your business wasn't created."
			render new
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
		if Hour.exists?(business_id: @business.id)
			@hours = Hour.find_by_business_id(@business.id) 
		else 
			@hours = Hour.new 
		end
	end

	def update
		@business = Business.find(params[:id])

		if @business.update_attributes(business_params)
			redirect_to business_path
		else
			render edit
		end
	end

	private
		def business_params
			params.require(:business).permit(:name, :address, :address_2, :city, :state, :zip, :phone)
		end
end
