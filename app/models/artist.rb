class Artist < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :active_artist_bookmarks, class_name: "Bookmark", foreign_key: "artist_followed_id", dependent: :destroy
  has_many :passive_artist_bookmarks, class_name: "Bookmark", foreign_key: "artist_follow_id", dependent: :destroy

  has_many :artist_follow_ids, through: :active_artist_bookmarks, source: :artist_follow
  has_many :artist_followed_ids, through: :passive_artist_bookmarks, source: :artist_followed

  has_many :events, dependent: :destroy

  # アーティストをフォローする
  def follow(other_artist)
    active_artist_bookmarks.create(artist_follow_id: other_artist.id)
  end

  # アーティストをアンフォローする
  def unfollow(other_artist)
    active_artist_bookmarks.find_by(artist_follow_id: other_artist.id).destroy
  end

  # 現在のアーティストがフォローしてたらtrueを返す
  def artist_following?(other_artist)
    artist_follow_ids.include?(other_artist)
  end

end
