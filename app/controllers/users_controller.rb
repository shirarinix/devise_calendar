class UsersController < ApplicationController
  # before_action :authenticate_user!

  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @users = @user.followings.order("create_at DESC")
    # @events = Event.includes(:user).order("create_at DESC")
    @events = @user.events
  end
  
  def following
    @user  = User.find(params[:id])
    @users = @user.followings
    render 'show_follow'
  end
  
  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end

end
