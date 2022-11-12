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
      if @user.update user_params
        redirect_to users_path(@user), notice: "Profile information updated"
      else
        render :show, status: :unprocessable_entity, alert: "PCannot be updated"
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

  def update_user_params
    params.require(:user).permit(:current_password, :password, :password_confirmation, :unconfirmed_email, :username)
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :username)
  end
  
  def verify_ownership
        unless @user == current_user
             redirect_to root_path, notice: "Not authorized"
        end
    end
  
  
  
end
