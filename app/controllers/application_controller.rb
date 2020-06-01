class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  private
 def current_user
     @current_user ||= User.find(session[:user_id]) if session[:user_id]
   end
    # def current_user
    #  @user = User.find(session[:user_id])
    #  #byebug
    # end

  #   def is_logged_in?
  #     !!session[:user_id]
  #  end
end
