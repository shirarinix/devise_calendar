class BookmarksController < ApplicationController

  def create
    bookmark = Bookmark.create(create_params)
    redirect_to controller: 'events', action: 'index'
  end

  def destroy
    bookmark = Bookmark.find(params[:id])
    bookmark.destroy
    redirect_to controller: 'events', action: 'index'
  end

  private

  def create_params
      params.permit(:following_id).merge(follower_id: current_user.id)
  end
end
