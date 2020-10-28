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

  # before_action :set_user

  # def create
  #   following = current_user.follow(@user)
  #   if following.save
  #     flash[:success] = 'ユーザーをフォローしました'
  #   　redirect_to @user
  #   else
  #     flash.now[:alert] = 'ユーザーをフォローに失敗しました'
  #   　redirect_to @user
  #   end
  # end

  # def destroy
  #   following = current_user.unfollow(@user)
  #   if followimg.destroy
  #     flash[:success] = 'ユーザーのフォロを解除しました'
  #   　redirect_to @user
  #   else
  #     flash.now[:alert] = 'ユーザーのフォロ解除に失敗しました'
  #     redirect_to @user
  #   end
  # end

  # private
  # def set_user
  #   @user = User.find(params[:bookmark_id][:follow_id])
  # end
end
