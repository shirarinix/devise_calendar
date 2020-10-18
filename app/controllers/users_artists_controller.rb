class UsersArtistsController < ApplicationController
  before_action :set_artist
  before_action :authenticate_user! # ログイン中のユーザーのみに許可（未ログインなら、ログイン画面へ移動）

  # お気に入り登録
  def create
    if @artist.user_id != current_user.id # 本人以外に限定
      @user_artist = UserArtist.create(user_id: current_user.id, artist_id: @artist.id)
    end
  end
  # お気に入り削除
  def destroy
    @user_artist = UserArtist.find_by(user_id: current_user.id, artist_id: @artist.id)
    @user_artist.destroy
  end

  private
  def set_artist
    @artist = Artist.find(params[:artist_id])
  end
end
