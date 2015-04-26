class SessionsController < ApplicationController
  def new
  end

  def create
    if User.find_by_email(params[:email])
      user = User.find_by_email(params[:email])
    else
      fb_user = User.from_omniauth(request.env['omniauth.auth'])
    end
    
    if fb_user
      session[:user_id] = fb_user.id
      redirect_to root_url
    elsif user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url
    else
      redirect_to('/login')
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to('/')
  end
end
