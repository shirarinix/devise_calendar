class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :active_bookmarks, class_name: "Bookmark", foreign_key: "follower_id", dependent: :destroy # 外部キーはfollower_id
  has_many :passive_bookmarks, class_name: "Bookmark", foreign_key: "following_id", dependent: :destroy # 外部キーはfollowing_id

  has_many :front_bookmarks, class_name: "Bookmark", foreign_key: "follower_id", dependent: :destroy
  has_many :back_bookmarks, class_name: "Bookmark", foreign_key: "artist_follow_id", dependent: :destroy
  #activeとpassiveは対を表すもので、架空中間テーブル(入口)を定義付ける。class_nameを使ってBookmarkモデルという事を示す。

  has_many :followers, through: :passive_bookmarks, source: :follower # フォローされている人(自身がフォローされている人)
  has_many :followings, through: :active_bookmarks, source: :following # フォローしている人

  has_many :artist_followers, through: :back_bookmarks, source: :follower
  has_many :artist_followings, through: :front_bookmarks, source: :artist_follow
  #架空のフォロー、フォロワーモデルを定義(出口)付け。throughを使用してそれぞれが中間テーブルを経由している事を示す。sourceで参考にするカラムを指定。

  has_many :events, dependent: :destroy

  # ユーザーをフォローする
  def follow(other_user)
    active_bookmarks.create(following_id: other_user.id, artist_follow_id: other_user.id)
  end

  # ユーザーをアンフォローする
  def unfollow(other_user)
    active_bookmarks.find_by(following_id: other_user.id, artist_follow_id: other_user.id).destroy
  end

  # 現在のユーザーがフォローしてたらtrueを返す  
  def following?(other_user)
    binding.pry
    followings.include?(other_user)
  end

  def artist_following?(other_user)
    binding.pry
    artist_followings.include?(other_user)
  end

  # def events
  #   return Event.where(user_id: self.id)
  # end
end
