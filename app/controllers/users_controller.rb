class UsersController < ApplicationController
  
  def show
    @user = User.find_by(id: params[:id])
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    #@user.save
    #byebug
    redirect_to users_path(@user.id)
    
  end

  
  private

def user_params
  params.require(:user).permit(:name, :height, :nausea, :happiness, :tickets, :admin)
end

end



