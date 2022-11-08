class UsersController < ApplicationController
  before_action :authenticate, :load_user, except: [:new, :create]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new user_params
    if @user.save
      login(@user)
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
      render :show, status: :unprocessable_entity
    end
  end
  
  
  
  private
  
  def load_user
    @user = User.find params[:id]
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :username)
  end
  
  
end
