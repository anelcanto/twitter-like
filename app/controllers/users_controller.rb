class UsersController < ApplicationController
  
  before_action :authenticate, :load_user, except: [:new, :create]
  before_action :verify_ownership, only: [:update, :show, :destroy]
  
  def new
    if session[:user_hash]
      @user = User.new_from_hash session[:user_hash]
      @user.valid?
    else
      @user = User.new
    end
  end
  
  def create
    if session[:user_hash]
      @user = User.new_from_hash session[:user_hash]
      @user.name = user_params[:name]
      @user.email = user_params[:email]
    else 
      @user = User.new user_params
    end
    if @user.save
      login(@user)
      session[:user_hash] = nil
      redirect_to root_path, notice: "You succesfully signed up."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end
  
  def update
    if @user.has_password?
      if @user.authenticate(params[:user][:current_password])
        if @user.update user_params
          redirect_to users_path(@user), notice: "Profile information updated"
        else
          render :show, status: :unprocessable_entity
        end
      else
        redirect_to users_path(@user), alert: "Your current password could not be verified"
      end
    else
      if @user.update user_params
        redirect_to users_path(@user), notice: "Profile information updated"
      else
        render :show, status: :unprocessable_entity
      end
    end
  end

  def destroy
    if @user.destroy
      logout
      redirect_to root_path, notice: "User deleted"
    end
  end
  
  private
  
  def load_user
    @user = User.find params[:id]
  end

  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :username, :avatar)
  end
  
  def verify_ownership
        unless @user == current_user
             redirect_to root_path, notice: "Not authorized"
        end
    end
  
  
  
end
