class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			redirect_to('/')
		else
			redirect_to('/signup')
		end
	end

	def edit
		@user = User.find(params[:id])
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
		def user_params
			params.require(:user).permit(:email, :password, :password_confirmation)
		end

		def userprofile_params
			params.require(:user).permit(:first_name, :last_name, :email, :username, :location, :hometown, :nickname, :headline, :website, :password, :password_confirmation)
		end
end
