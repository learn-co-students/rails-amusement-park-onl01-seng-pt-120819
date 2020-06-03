class UsersController < ApplicationController
    before_action :authentication_required, except: [:new, :create, :index]
    
    def index 

    end
    def new
        @user = User.new 
    end

    def create 
        # byebug
       user = User.create(user_params)
        if user
        
            session[:user_id] = user.id
            redirect_to user_path(user)
       else 
            redirect_to  root_path
       end 
    end 

    def show 
        @user = User.find_by(:id => params[:id])
        end 

    private
  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
  end
end
