class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :active_user_bookmarks, class_name: "Bookmark", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_user_bookmarks, class_name: "Bookmark", foreign_key: "following_id", dependent: :destroy

  has_many :front_user_bookmarks, class_name: "Bookmark", foreign_key: "follower_id", dependent: :destroy
  has_many :back_user_bookmarks, class_name: "Bookmark", foreign_key: "follow_id", dependent: :destroy
  #activeとpassive、frontとbackは対を表すもの。架空の中間テーブル(入口)を定義付け。class_nameを使ってBookmarkモデルという事を示す。

  has_many :followers, through: :passive_user_bookmarks, source: :follower # フォローする人
  has_many :followings, through: :active_user_bookmarks, source: :following # フォローされる人

  has_many :artist_followers, through: :back_user_bookmarks, source: :follower # フォローする人
  has_many :artist_followings, through: :front_user_bookmarks, source: :follow # フォローされる人
  #それぞれに対する架空のフォロー、フォロワーモデルを定義(出口)付け。throughを使用して中間テーブルを経由している事を示す。sourceで参考にするカラムを指定。

  has_many :events, dependent: :destroy

  # ログインしているユーザーがユーザーをフォローしているとtrueを返す
  def following?(other_user)
    binding.pry
    followings.include?(other_user)
  end
  # ログインしているユーザーがアーティストをフォローしているとtrueを返す
  def artist_following?(other_user)
    binding.pry
    artist_followings.include?(other_user)
  end

  # ユーザーがユーザーをフォローする時に実行
  def follow(other_user)
    binding.pry
    active_user_bookmarks.create(following_id: other_user.id)#, follow_id: other_user.id)
  end
  # ユーザーがアーティストをフォローする時に実行
  def artist_follow(other_user)
    binding.pry
    front_user_bookmarks.create(follow_id: other_user.id)
  end

  # ユーザーがユーザーをアンフォローする時に実行
  def unfollow(other_user)
    binding.pry
    active_user_bookmarks.find_by(following_id: other_user.id)#, follow_id: other_user.id).destroy
  end
  # ユーザーがアーティストをアンフォローする時に実行
  def artist_unfollow(other_user)
    binding.pry
    front_user_bookmarks.find_by(follow_id: other_user.id)
  end

  # def events
  #   return Event.where(user_id: self.id)
  # end
end
