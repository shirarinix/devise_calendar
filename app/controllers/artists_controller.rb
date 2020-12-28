class ArtistsController < ApplicationController
  before_action :authenticate_artist!

  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
    @user = User.find(params[:id])
    @artist_events = @artist.events
  end

  def follow
    @artist  = Artist.find(params[:id])
    @user = User.find(params[:id])
    @artists = @artist.follow_ids.order("create_at DESC")
    @artists = @artist.user_follow_ids.order("create_at DESC")
    render 'artist_follow'
  end

  def followed
    @artist  = Artist.find(params[:id])
    @user = User.find(params[:id])
    @artists = @artist.followed_ids.order("create_at DESC")
    @artists = @user.artist_followers.order("create_at DESC")
    render 'artist_followed'
  end

end
