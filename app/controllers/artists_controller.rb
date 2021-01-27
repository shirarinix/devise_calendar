class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
    @events = @artist.events
  end

  def follow
    @artist  = Artist.find(params[:id])
    @artists = @artist.follow_ids.order('create_at DESC')
    @artists = @artist.user_follow_ids.order('create_at DESC')
    @events = @artist.events
    render 'artist_follow'
  end

  def followed
    @artist  = Artist.find(params[:id])
    @artists = @artist.followed_ids.order('create_at DESC')
    @artists = @artist.user_followed_ids.order('create_at DESC')
    @events = @artist.events
    render 'artist_followed'
  end
end
