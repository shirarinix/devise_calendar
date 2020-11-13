class ArtistsController < ApplicationController

  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
    @artists = @artist.artist_follow_ids
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
