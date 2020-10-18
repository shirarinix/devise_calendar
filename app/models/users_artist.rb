class UsersArtist < ApplicationRecord
  belongs_to :user
  belongs_to :artist

  validates_uniqueness_of :artist_id, scope: :user_id # バリデーション（ユーザーとアーティストの組み合わせは一意）
  # validates_uniqueness_of :user_id, scope: :artist_id # 同じ人物を複数回お気に入り登録させないため。
end
