class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    # @artist = Artist.find(params[:id])
    @events = @user.events
  end

  def following
    @user  = User.find(params[:id])
    @users = @user.followings.order('create_at DESC')
    @users = @user.artist_followings.order('create_at DESC')
    @events = @user.events
    render 'user_following'
  end

  def follower
    @user  = User.find(params[:id])
    # @artist = Artist.find(params[:id])
    @users = @user.followers.order('create_at DESC')
    @users = @user.artist_followers.order('create_at DESC')
    @events = @user.events
    render 'user_follower'
  end
end
