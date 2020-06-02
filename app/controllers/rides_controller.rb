class RidesController < ApplicationController

    def update 
        ride = Ride.find_by(id: params[:id])
        message = ride.take_ride

        user = User.find_by(id: ride.user_id)

        redirect_to user_path(user), flash: { message: message }
    end

end