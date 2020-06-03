class SessionController < ApplicationController
  def new
    'http success'
  end

  def create 
      user = User.find_by(:name => params[:user][:name])
      
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id 
      redirect_to user_path(user)
      else 
        redirect_to '/'    
      end 
  end 

  def destroy 
      reset_session
        redirect_to '/' 
  end 

end