class UsersController < ApplicationController

  # before_action :require_logout, only: [:new]
  before_action :require_login, except: [:new, :create, :show, :timeline]
  before_action :require_current_user, only: [:edit, :update, :destroy]


  def index
    redirect_to user_path(current_user)
  end

  def new
    @user = User.new
    @user.build_profile
  end

  def create
    @user = User.new(whitelisted_params)
    if @user.save
      if sign_in(@user)
        User.send_welcome_email(@user.id)
        flash[:success] = "You successfully signed in"
        redirect_to user_path(@user.id)
      else
        flash[:error] = "The sign up was not working"
        redirect_to user_path(@user.id)
      end
    else
      flash.now[:error] = "The sign up was not successful"
      render :new
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update( whitelisted_params )
      flash[:success] = "user updated"
      redirect_to user_path(@user)
    else
      flash[:error] = "user not updated"
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def add_avatar
    @user = User.find(params[:user_id])
  end

  def timeline
    if signed_in_user?
      @current_user.posts.build
    end
    @user = User.find(params[:user_id])
  end

  def photos

  end

  def friends
  end

  
  private

    def whitelisted_params
      params.require(:user).
      permit(:first_name, 
        :last_name, 
        :email, 
        :password, 
        :password_confirmation,
        :avatar_id,
        :profile_attributes => [
            :gender,
            :birthday,
            :current_location,
            :hometown,
            :school,
            :motto,
            :about,
            :telephone])
    end

end
