class AttractionsController < ApplicationController 
    before_action :set_attraction

    def index
        @attractions = Attraction.all
        @user = ApplicationController.current_user(session)
    end

    def new
        @attraction = Attraction.new
    end

    def create 
        @attraction = Attraction.create(attraction_params)
        redirect_to attraction_path(@attraction)
    end

    def show 
        #@attraction
        @user = ApplicationController.current_user(session)
    end

    def edit 
        #@attraction
    end

    def update 
        @attraction.update(attraction_params)

        if @attraction.save
            redirect_to @attraction
        else
            render :edit
        end
    end

    private
    def set_attraction
        @attraction = Attraction.find_by(id: params[:id])
    end

    def attraction_params
        params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
    end


end