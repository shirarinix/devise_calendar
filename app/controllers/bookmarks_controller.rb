class BookmarksController < ApplicationController
  def create
    bookmark = current_user.bookmarks.build(artist_id: params[:artist_id])
    bookmark.save!
    redirect_to artist_path, success: t('.flash.bookmark')
  end

  def destroy
    current_user.bookmarks.find_by(artist_id: params[:artist_id]).destroy!
    redirect_to artist_path, success: t('.flash.not_bookmark')
  end
end
