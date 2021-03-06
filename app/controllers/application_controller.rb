class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :require_login

  private

  def require_login
    if not current_user
      redirect_to new_session_path
    end
  end

 def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
 end

  	helper_method :current_user

  	def ensure_logged_in
  		unless current_user
  			flash[:alert] = "Thanks for checking out LinkShare. Please log in to add bookmarks."
  			redirect_to new_session_path
  		end
  	end

end
