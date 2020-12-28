class BookmarksController < ApplicationController

  def create
    if current_user.present?
      if bookmark_user.save
        flash[:notice] = "↓フォローしました"
        redirect_to [@user, @artist]
      end
    else
      if bookmark_artist.save
        flash[:notice] = "↓フォローしました"
        redirect_to [@artist, @user]
      end
    end
  end

  def destroy
    if current_user.present?
      bookmark_user_release.destroy
      flash[:notice] = "↓フォローを解除しました"
      redirect_to [@user, @artist]
    else
      bookmark_artist_release.destroy
      flash[:notice] = "↓フォローを解除しました"
      redirect_to [@user, @artist]
    end
  end

  private

  # def find_user
  #   @user = User.find(params[:following_id])
  # end

  # def find_artist
  #   @artist = Artist.find(params[:follow_id])
  # end

  # def user_status
  #   @user = User.find(params[:following_id])
  # end

  # def artist_status
  #   @artist = Artist.find(params[:follow_id])
  # end

  def bookmark_user # ログイン者がユーザー側をお気に入り登録(フォロー)する時のメッソド
    if params[:following_id].present?
      @user = User.find(params[:following_id])
      current_user.follow(@user)
    else
      @artist = Artist.find(params[:follow_id])
      current_user.artist_follow(@artist)
    end
  end

  def bookmark_artist # ログイン者がアーティスト側をお気に入り登録(フォロー)する時のメソッド
    if params[:follow_id].present?
      @artist = Artist.find(params[:follow_id])
      current_artist.follow(@artist)
    else
      @user = User.find(params[:following_id])
      current_artist.user_follow(@user)
    end
  end

  def bookmark_user_release # ログイン者がユーザー側をお気に入り(フォロー)解除する時のメソッド
    if Bookmark.find(params[:id]).following_id?
      @user = Bookmark.find(params[:id]).following
      current_user.unfollow(@user)
    else
      @artist = Bookmark.find(params[:id]).follow
      current_user.artist_unfollow(@artist)
    end
  end

  def bookmark_artist_release # ログイン者がアーティスト側をお気に入り(フォロー)解除する時のメソッド
    if Bookmark.find(params[:id]).follow_id?
      @artist = Bookmark.find(params[:id]).follow
      current_artist.unfollow(@artist)
    else
      @user = Bookmark.find(params[:id]).following
      current_artist.user_unfollow(@user)
    end
  end

end
