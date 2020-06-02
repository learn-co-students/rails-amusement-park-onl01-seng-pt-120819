require 'rack-flash'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  configure do
    use Rack::Flash, :sweep => true
  end

  def index 
    render 'layouts/application'
  end
end
