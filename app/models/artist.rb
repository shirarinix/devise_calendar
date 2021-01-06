class Artist < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum sex: { man: 1, woman: 2}

  has_one_attached :artist_image

  has_many :active_artist_bookmarks, class_name: "Bookmark", foreign_key: "followed_id", dependent: :destroy #関連のあるモデルを指す外部キー(foreign_key)のカラム名を設定。
  has_many :passive_artist_bookmarks, class_name: "Bookmark", foreign_key: "follow_id", dependent: :destroy #followed_idの外部キー(followed_id)

  has_many :front_artist_bookmarks, class_name: "Bookmark", foreign_key: "followed_id", dependent: :destroy #関連のあるモデルを指す外部キー(foreign_key)のカラム名を設定。
  has_many :back_user_bookmarks, class_name: "Bookmark", foreign_key: "follow_id", dependent: :destroy #follower_idの外部キー(follow_id)
  # has_many :back_artist_bookmarks, class_name: "Bookmark", foreign_key: "following_id", dependent: :destroy #following_idの外部キー(followed_id)
  #activeとpassive、frontとbackは対を表すもの。架空の中間テーブル(入口)を定義付け。class_nameを使ってBookmarkモデルという事を示す。

  has_many :followed_ids, through: :passive_artist_bookmarks, source: :followed # フォローした人
  has_many :follow_ids, through: :active_artist_bookmarks, source: :follow # フォローされた人

  has_many :user_followed_ids, through: :back_user_bookmarks, source: :follower # フォローした人
  # has_many :user_followed_ids, through: :back_artist_bookmarks, source: :followed # フォローした人
  has_many :user_follow_ids, through: :front_artist_bookmarks, source: :following # フォローされた人
  #架空のフォロー、フォロワーモデルを定義(出口)付け。throughを使用して中間テーブルを経由している事を示す。sourceで指定してアクセスできるようにする。

  has_many :events, dependent: :destroy

  validates :artistname, :birthday, :sex, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }

  # ログインしているアーティストがアーティストをフォローしているとtrueを返す
  def follow_id?(other_artist)
    binding.pry
    follow_ids.include?(other_artist)
  end
  # ログインしているアーティストがユーザーをフォローしているとtrueを返す
  def user_follow_id?(other_artist)
    binding.pry
    user_follow_ids.include?(other_artist)
  end

  # アーティストがアーティストをフォローする時に実行
  def follow(other_artist)
    binding.pry
    active_artist_bookmarks.create(follow_id: other_artist.id)
  end
  # アーティストがユーザーをフォローする時に実行
  def user_follow(other_artist)
    binding.pry
    front_artist_bookmarks.create(following_id: other_artist.id)
  end

  # アーティストがアーティストをアンフォローする時に実行
  def unfollow(other_artist)
    binding.pry
    active_artist_bookmarks.find_by(follow_id: other_artist.id)
  end
  # アーティストがユーザーをアンフォローする時に実行
  def user_unfollow(other_artist)
    binding.pry
    front_artist_bookmarks.find_by(following_id: other_artist.id)
  end

end
