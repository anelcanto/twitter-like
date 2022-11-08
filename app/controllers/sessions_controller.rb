class SessionsController < ApplicationController
  def new
  end
  
  def create
    @user = User.where(email: params[:email]).first
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, alert: "Logged in."
    else
      redirect_to login_path, alert: "Invalid email or Password"
    end
  end
end
