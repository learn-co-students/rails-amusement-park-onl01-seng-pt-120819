class UsersController < ApplicationController 

    def new
        @user = User.new
    end
    
    def create 
        @user = User.create(user_params)
        # if params[:password] != params[:password_confirmation]
        #      redirect_to '/users/new'
        # end 
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    def show 
        if session.include? :user_id
        @user = User.find_by(id: session[:user_id])
        else 
            redirect_to '/'
        end
    end

    private
 
    def user_params
        params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password)
    end
end