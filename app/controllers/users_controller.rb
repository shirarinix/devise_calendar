class UsersController < ApplicationController
  # before_action :authenticate_user!

  def index
    @users = User.all
  end
  
  def show
    binding.pry
  #  if current_user.present?
    @user = User.find(params[:id])
    @artist = Artist.find(params[:id])
    @events = @user.events
    # @events = Event.includes(:user).order("create_at DESC")
  end
  
  def following
    binding.pry
    @user  = User.find(params[:id])
    @users = @user.followings.order("create_at DESC")
    @users = @user.artist_followings.order("create_at DESC")
    render 'show_follow'
  end
  
  def follower
    @user  = User.find(params[:id])
    @artist = Artist.find(params[:id])
    @users = @user.artist_followers.order("create_at DESC")
    @artists = @artist.user_followed_ids.order("create_at DESC")
    render 'show_follower'
  end

end
