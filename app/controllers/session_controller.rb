class SessionController < ApplicationController
  skip_before_action :verified_user, only: [:new, :create]
  def new
    
  end
    def create
        @user = User.find_by(name: params[:user][:name])
      if @user 
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        render :new
      end
    end

    def destroy
     
      session.delete(user_id: current_user.id)
      redirect_to root_url
    end

end