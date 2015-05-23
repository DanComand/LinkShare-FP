class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		redirect_to bookmarks_url, notice: "Welcome to LinkShare!"
      
  	else
  		render "new"
  	end
  end

  private
  def user_params
  	params.require(:user).permit(:firstName, :lastName, :email, :password, :password_confirmation, :user_id, :avatar)

	end



end
