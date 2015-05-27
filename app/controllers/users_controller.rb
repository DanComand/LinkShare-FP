class UsersController < ApplicationController

skip_before_filter :require_login, :only => [:new, :create]

  def new
  	@user = User.new
  end

  def show
    @user = User.find(params[:id])
    # @bookmarks = bookmarks.where(user_id = current_user.id)
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		redirect_to new_session_path, notice: "Welcome to LinkShare!"
  	else
  		render "new"
  	end
  end

  private
  def user_params
  	params.require(:user).permit(:firstName, :lastName, :email, :password, :password_confirmation, :user_id, :avatar)

	end



end
