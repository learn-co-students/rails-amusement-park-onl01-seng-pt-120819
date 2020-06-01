class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
def authentication_required
    if !logged_in?
      redirect_to signin_path
    end
end 

  def logged_in?
    !!current_user
  end

  def current_user 
      User.find(session[:user_id]) if session[:user_id]

  end 

  
end
