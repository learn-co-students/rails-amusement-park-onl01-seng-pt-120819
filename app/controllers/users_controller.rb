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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), :alert => "You Just Updated Your User Account"
    else
      render 'edit', :alert => "Please Fill In All Forms"
    end
  end

  def ride
    @ride = Ride.new(user_id: current_user.id)
    msg = @ride.take_ride
    byebug
    redirect_to user_path(current_user), :alert => msg
    
  end
  
  private

def user_params
  params.require(:user).permit(:name, :height, :nausea, :happiness, :tickets, :password, :admin)
end

end



