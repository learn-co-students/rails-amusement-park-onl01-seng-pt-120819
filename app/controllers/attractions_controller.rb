class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
    @user = current_user
   #byebug
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      render 'new', :alert => "Please Fill In All Forms"
    end
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id])
    if @attraction.update(attraction_params)
      redirect_to attraction_path(@attraction), :alert => "You Just Updated The Attraction"
    else
      render 'edit', :alert => "Please Fill In All Forms"
      
    end
  end

  def show
    @attraction = Attraction.find_by(id: params[:id])
    #byebug
    #@ride = @attraction.rides.build(user_id: current_user.id)
    @user = current_user
    @ride = Ride.new
    @ride.user = @user    
    @ride.attraction = @attraction
    
    #byebug
  end

 

  private

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end

end
