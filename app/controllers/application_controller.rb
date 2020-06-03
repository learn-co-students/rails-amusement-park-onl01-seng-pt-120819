class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

def authentication_required
    if !logged_in?
      redirect_to '/'
    end
end 

  def logged_in?
    !!current_user
  end

  def current_user 
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end 

  def admin_only 
      unless current_user.admin 
        redirect_to user_path(current_user)
      end
  end 

  
end
