class SessionsController < ApplicationController
    def new
        @users = User.all
    end
    
    def create
        @user = User.find_by(id: params[:user_name]) #user_name = user_id
        if @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else 
            redirect_to '/signin'
        end
    end

    def destroy 
        session.destroy
        redirect_to '/'
    end

end