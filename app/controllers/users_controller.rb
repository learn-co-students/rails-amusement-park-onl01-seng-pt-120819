class UsersController < ApplicationController

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
        # if !current_user.admin 
        #     if @user != current_user
        #         redirect_to root_path
        #     end
        # end
    end

    # def signin
    # end
    private 

    def user_params
        params.require(:user).permit(:name, :height, :nausea, :happiness, :tickets, :password, :admin)
    end

end