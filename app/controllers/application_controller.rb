class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

    def current_user
     @user = User.find(session[:user_id])
     #byebug
    end

    def is_logged_in?
      !!session[:user_id]
   end
end
