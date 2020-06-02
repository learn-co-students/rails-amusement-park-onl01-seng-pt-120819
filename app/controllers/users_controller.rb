class UsersController < ApplicationController

  def new 
    @user = User.new
  end
  
  def create
    user = User.create(user_params)
    session[:user_id] = user.id
    redirect_to user_path(user)
  end
  
  def show 
    return redirect_to '/' unless (session.include? :user_id) && (!!User.find_by(id: session[:user_id]))

    @user = User.find_by(id: params[:id])
  end
  
  private
 
  def user_params
    params.require(:user).permit(
      :name,
      :height,
      :nausea,
      :tickets,
      :admin,
      :password,
      :happiness
    )
  end
  
end