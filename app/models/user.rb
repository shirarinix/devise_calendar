class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum sex: ["男性", "女性"]

  has_one_attached :user_image
  # ↓activeとpassive、frontとbackは対。架空の中間テーブル(入口)を定義。class_nameを使ってBookmarkモデルという事を示す。
  has_many :active_user_bookmarks, class_name: 'Bookmark', foreign_key: 'follower_id', dependent: :destroy #:following_id(FK :follower_id)
  has_many :passive_user_bookmarks, class_name: 'Bookmark', foreign_key: 'following_id', dependent: :destroy #:follower_id(FK :following_id)
  has_many :front_user_bookmarks, class_name: 'Bookmark', foreign_key: 'follower_id', dependent: :destroy #:followed_id(FK :following_id)
  has_many :back_artist_bookmarks, class_name: 'Bookmark', foreign_key: 'following_id', dependent: :destroy #:followed_id(FK :following_id)
  # has_many :back_user_bookmarks, class_name: "Bookmark", foreign_key: "follow_id", dependent: :destroy #:follow_id(FK :follower_id)

  # ↓架空のフォロー、フォロワーモデルを定義(出口)付け。throughで中間テーブルを経由している事を示す。sourceでアクセスできるようにする。
  has_many :followers, through: :passive_user_bookmarks, source: :follower # フォローした人
  has_many :followings, through: :active_user_bookmarks, source: :following # フォローされた人
  has_many :artist_followers, through: :back_artist_bookmarks, source: :followed # フォローした人
  has_many :artist_followings, through: :front_user_bookmarks, source: :follow # フォローされた人
  # has_many :artist_followers, through: :back_user_bookmarks, source: :follower # フォローした人

  has_many :events, dependent: :destroy

  validates :nickname, :birthday, :sex, :email, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }

  # フォローしているとtrue、してなければfalseを返す
  def following?(other_user)
    # binding.pry
    followings.include?(other_user)
  end

  def artist_following?(other_user)
    # binding.pry
    artist_followings.include?(other_user)
  end

  # ユーザー：フォロー、アンフォロー
  def follow(other_user)
    active_user_bookmarks.create(following_id: other_user.id)
  end

  def unfollow(other_user)
    active_user_bookmarks.find_by(following_id: other_user.id)
  end

  # ユーザー：アーティストのフォロー、アンフォロー
  def artist_follow(other_user)
    front_user_bookmarks.create(follow_id: other_user.id)
  end

  def artist_unfollow(other_user)
    front_user_bookmarks.find_by(follow_id: other_user.id)
  end
end
