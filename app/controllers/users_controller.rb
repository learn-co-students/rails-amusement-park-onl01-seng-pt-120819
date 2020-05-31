class UsersController < ApplicationController
  
  def index

  end

  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
      
    else
      render 'new'
    end
    
  end

  def ride
    
    @ride = Ride.new(user_id: current_user.id)
    msg = @ride.take_ride
    redirect_to user_path(current_user), :alert => msg
    
  end
  
  private

def user_params
  params.require(:user).permit(:name, :height, :nausea, :happiness, :tickets, :password, :admin)
end

end



