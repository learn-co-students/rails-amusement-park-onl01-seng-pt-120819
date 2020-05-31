class SessionsController < ApplicationController
  def new
    
  end

  def create
    @user = User.find_by(id: params[:user][:id])
    session[:user_id] = @user.id
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end
end
