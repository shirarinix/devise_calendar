class BookmarksController < ApplicationController
  # before_action :create_params, if: porc { current_user == nil }

  def show
    bookmark = Bookmark.find(params[:id])
  end

  def create
    bookmark = Bookmark.new(create_params)
    binding.pry
    bookmark.save
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
      # binding.pry
      params.permit(:following_id, :follow_id).merge(follower_id: current_user.id)
    else
      params.permit(:follow_id, :following_id).merge(followed_id: current_artist.id)
    end
  end

end
