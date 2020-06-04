class RidesController < ApplicationController
  def new
    @ride = Ride.new
  end

 

  def show
    @ride = Ride.find(params[:id])
    
  end

  def create
    #byebug
    @ride = Ride.new(ride_params)
    @user = current_user
    @attraction = Attraction.find(ride_params[:attraction_id])
    @ride.user = @user
    @ride.attraction = @attraction
    @ride.save
    message = @ride.take_ride
    
    #byebug
    redirect_to user_path(@user), flash: { message: message }
  end
private

def ride_params
  #byebug
    params.require(:ride).permit(:user_id, :attraction_id)
  end
end

