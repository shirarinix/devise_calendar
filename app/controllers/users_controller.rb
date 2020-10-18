class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @artists = @user.artists

    users_artists = UserArtist.where(user_id: current_user.id).pluck(:artist_id) # ログイン中のユーザーのお気に入りのartist_idカラムを取得
    @user_artist_list = Artist.find(users_artists) # artistsテーブルから、お気に入り登録済みのレコードを取得
  end
end
