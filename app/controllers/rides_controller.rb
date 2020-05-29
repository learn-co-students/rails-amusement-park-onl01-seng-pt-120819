class RidesController < ApplicationController
    include RidesHelper

    def create 
        @user = User.find_by(id: session[:user_id])
        @attraction = Attraction.find_by(id: params[:attraction_id])
        if @user && @attraction 
           # take_ride(@user, @attraction)
            
            flash[:alert] = take_ride(@user, @attraction)
            redirect_to user_path(@user)
        end
    end
end