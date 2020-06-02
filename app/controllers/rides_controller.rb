class RidesController < ApplicationController

    def create 
        @user = ApplicationController.current_user(session)
        @attraction = Attraction.find_by(id: params[:attraction_id])
        
        @ride = Ride.new(user: @user, attraction: @attraction)
   
        flash[:alert] = @ride.take_ride
        redirect_to user_path(@user)
    end
end