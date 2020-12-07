class ArtistsController < ApplicationController
  # before_action :authenticate_artist!

  def index
    @artists = Artist.all
  end

  def show
    binding.pry
  #  if current_artist.present?
    @artist = Artist.find(params[:id])
    @user = User.find(params[:id])
    # @events = @artist.events
    # @events = Event.includes(:artist).order("create_at DESC")
  end

  def follow
    @artist  = Artist.find(params[:id])
    @user = User.find(params[:id])
    @artists = @artist.artist_follow_ids.order("create_at DESC")
    @artists = @artist.user_following.order("create_at DESC")
    render 'show_follow'
  end

  def followed
    @artist  = Artist.find(params[:id])
    @user = User.find(params[:id])
    @artists = @artist.artist_followed_ids.order("create_at DESC")
    @artists = @user.artist_followers.order("create_at DESC")
    render 'show_follower'
  end

end
