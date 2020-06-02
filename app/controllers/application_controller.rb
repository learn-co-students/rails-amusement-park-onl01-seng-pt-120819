require 'rack-flash'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  configure do
    use Rack::Flash, :sweep => true
  end

  def self.current_user(session)
    User.find_by(id: session[:user_id])
  end
  
  def self.is_logged_in?(session)
      session[:user_id] ? true : false
  end
end
