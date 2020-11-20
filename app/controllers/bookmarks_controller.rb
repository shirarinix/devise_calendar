class BookmarksController < ApplicationController
  # before_action :create_params, if: porc { current_user == nil }

  def show
    bookmark = Bookmark.find(params[:id])
  end

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
    if current_user.present?
      params.permit(:following_id).merge(follower_id: current_user.id)
    else
      params.permit(:artist_follow_id).merge(artist_followed_id: current_artist.id)
    end
    # binding.pry
    # params.permit(:artist_follow_id).merge(artist_followed_id: current_artist.id, follower_id: current_user.id)
  end

end
