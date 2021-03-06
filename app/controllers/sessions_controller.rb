class SessionsController < ApplicationController
  
  skip_before_filter :require_login, :only => [:new, :create]

  def new

  end

  def create
  	user = User.find_by(email: params[:email])
  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
  		redirect_to lists_url, notice: "Logged in!"
  	else
  		flash.now[:alert] = "Invalid email or password"
  		render "new"
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to '/', notice: "Logged out!"
  end
end
