class SessionsController < ApplicationController
  def new
    
  end

  def create
    @user = User.find_by(name: params[:user][:name])
     session[:user_id] = params[:user][:name]
     byebug
    #  if session[:user_id]
       redirect_to user_path(@user)
    # else 
    #   redirect_to '/'
    # end
    
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end
end
