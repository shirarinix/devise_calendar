class Artist < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :active_artist_bookmarks, class_name: "Bookmark", foreign_key: "artist_followed_id", dependent: :destroy # 外部キーはartist_followed_id
  has_many :passive_artist_bookmarks, class_name: "Bookmark", foreign_key: "artist_follow_id", dependent: :destroy # 外部キーはartist_follow_id

  has_many :front_bookmarks, class_name: "Bookmark", foreign_key: "artist_followed_id", dependent: :destroy
  has_many :back_bookmarks, class_name: "Bookmark", foreign_key: "following_id", dependent: :destroy
  #activeとpassiveは対を表すもので、架空中間テーブル(入口)を定義付ける。class_nameを使ってBookmarkモデルという事を示す。

  has_many :artist_followed_ids, through: :passive_artist_bookmarks, source: :artist_followed # フォローされている人(自身がフォローされている人)
  has_many :artist_follow_ids, through: :active_artist_bookmarks, source: :artist_follow # フォローしている人

  has_many :user_followed_ids, through: :back_bookmarks, source: :artist_followed
  has_many :user_followings, through: :front_bookmarks, source: :following
  #架空のフォロー、フォロワーモデルを定義(出口)付け。throughを使用してそれぞれが中間テーブルを経由している事を示す。sourceで参考にするカラムを指定。

  has_many :events, dependent: :destroy

  # アーティストをフォローする
  def follow(other_artist)
    active_artist_bookmarks.create(artist_follow_id: other_artist.id, following_id: other_artist.id)
  end

  # アーティストをアンフォローする
  def unfollow(other_artist)
    active_artist_bookmarks.find_by(artist_follow_id: other_artist.id, following_id: other_artist.id).destroy
  end

  # 現在のアーティストがフォローしてたらtrueを返す
  def artist_follow_id?(other_artist)
    binding.pry
    artist_follow_ids.include?(other_artist)
  end

  def user_following?(other_artist)
    binding.pry
    user_followings.include?(other_artist)
  end

end
