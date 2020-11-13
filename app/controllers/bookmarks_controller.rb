class BookmarksController < ApplicationController
  # before_action :create_params, if: porc { current_user == nil }

  def create
      bookmark = Bookmark.create(create_params)
      binding.pry
      # bookmark = Bookmark.create(artist_create_params)
      redirect_to controller: 'events', action: 'index'
  end

  def destroy
    bookmark = Bookmark.find(params[:id])
    bookmark.destroy
    redirect_to controller: 'events', action: 'index'
  end

  private

  def create_params
    # binding.pry
    params.permit(:following_id, :artist_follow_id).merge(follower_id: current_user.id, artist_follow_id: current_artist.id)
    # binding.pry
    # params.permit(:artist_follow_id).merge(artist_followed_id: current_artist.id, follower_id: current_user.id)
  end

end
