class UsersController < ApplicationController
    skip_before_action :verify, only: [:new, :create]

    def new 
        @user = User.new 
    end

    def create
        @user = User.new(user_params)
        if @user.save 
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def edit
        
    end

    def show
        @user = User.find_by(id: params[:id])
    end

    # def signin
    #     if @user = User.find_by(name: params[:user][:name]) 
    #         session[:user_id] = @user.id 
    #         redirect_to user_path(@user)
    #     else
    #         render :new
    #     end
    # end
    private 

    def user_params
        params.require(:user).permit(:name, :height, :nausea, :happiness, :tickets, :password, :admin)
    end

end