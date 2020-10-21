class ArtistsController < ApplicationController
  def index
    @artists = Artist.all.includes(:user).recent
  end

  def bookmarks
    @artists = current_user.bookmark_artists.includes(:user).recent
  end
end
