class AttractionsController < ApplicationController
        before_action :find_attraction, only: [:show, :edit, :update]
    
    def index 
        @attractions = Attraction.all
        # @user = User.find_by(id: session[:user_id]) 

    end 

    def new 
        # @attraction = Attraction.new 
    end 

    def create 
        @attraction = Attraction.create(attraction_params)
        if @attraction
            redirect_to attractions_path(@attraction)
        else
             render :new
        end
    end 

    def show 
       
    end 

    private 

    def find_attraction
        @attraction = Attraction.find_by(:id => params[:id])
    end
    
    def atrac_params
        params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
    end
end
