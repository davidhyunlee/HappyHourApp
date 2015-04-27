class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			session[:user_id] = @user.id.to_s
			flash[:success] = "You've successfully created an account."
			redirect_to('/')
		else
			flash[:failure] = "Something went wrong. Your account wasn't created."
			redirect_to('/signup')
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		render plain: params
		# @user = User.find(params[:id])

		# if @user.update_attributes(userprofile_params)
		# 	redirect_to('/')
		# else
		# 	render edit
		# end
	end

	private
		def user_params
			params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :location, :hometown, :nickname, :headline, :website)
		end

		def userprofile_params
			params.require(:user).permit(:first_name, :last_name, :email, :username, :location, :hometown, :nickname, :photo, :headline, :website, :password, :password_confirmation)
		end
end
