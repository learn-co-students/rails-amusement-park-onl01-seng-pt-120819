class RidesController < ApplicationController

    def create 
        @user = User.find_by(id: session[:user_id])
        @attraction = Attraction.find_by(id: params[:attraction_id])
        
        if @user && @attraction 
         @ride = Ride.new(user: @user, attraction: @attraction)
   
        flash[:alert] = @ride.take_ride
        redirect_to user_path(@user)
        end
    end
end