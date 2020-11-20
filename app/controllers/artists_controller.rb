class ArtistsController < ApplicationController

  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
    @user = User.find(params[:id])
    @artists = @artist.artist_follow_ids.order("create_at DESC")
    @users = @user.followings.order("create_at DESC")
    # @artists = @artist.followings.order("create_at DESC"
    # @events = @artist.events
  end

  def follow
    @artist  = Artist.find(params[:id])
    @artists = @artist.artist_follow_ids
    render 'show_follow'
  end
  
  def followed
    @artist  = Artist.find(params[:id])
    @artists = @artist.artist_followed_ids
    render 'show_follower'
  end

end
