class Artist < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum sex: ["男性", "女性"]

  has_one_attached :artist_image
  # ↓activeとpassive、frontとbackは対。架空の中間テーブル(入口)を定義。class_nameを使ってBookmarkモデルという事を示す。
  has_many :active_artist_bookmarks, class_name: 'Bookmark', foreign_key: 'followed_id', dependent: :destroy #:follow_id(FK :followed_id)
  has_many :passive_artist_bookmarks, class_name: 'Bookmark', foreign_key: 'follow_id', dependent: :destroy #:followed_id(FK :follow_id)
  has_many :front_artist_bookmarks, class_name: 'Bookmark', foreign_key: 'followed_id', dependent: :destroy #:following_id(FK :followed_id)
  has_many :back_user_bookmarks, class_name: 'Bookmark', foreign_key: 'follow_id', dependent: :destroy #:follower_id(FK :follow_id)
  # has_many :back_artist_bookmarks, class_name: "Bookmark", foreign_key: "following_id", dependent: :destroy #:following_id(FK :followed_id)

  # ↓架空のフォロー、フォロワーモデルを定義(出口)。throughで中間テーブルを経由している事を示す。sourceでアクセスできるようにする。
  has_many :followed_ids, through: :passive_artist_bookmarks, source: :followed # フォローした人
  has_many :follow_ids, through: :active_artist_bookmarks, source: :follow # フォローされた人
  has_many :user_followed_ids, through: :back_user_bookmarks, source: :follower # フォローした人
  has_many :user_follow_ids, through: :front_artist_bookmarks, source: :following # フォローされた人
  # has_many :user_followed_ids, through: :back_artist_bookmarks, source: :followed # フォローした人

  has_many :events, dependent: :destroy

  validates :artistname, :birthday, :sex, :email, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }

  # フォローしているとtrue、してなければfalseを返す
  def follow_id?(other_artist)
    # binding.pry
    follow_ids.include?(other_artist)
  end

  def user_follow_id?(other_artist)
    # binding.pry
    user_follow_ids.include?(other_artist)
  end

  # アーティスト：フォロー、アンフォロー
  def follow(other_artist)
    active_artist_bookmarks.create(follow_id: other_artist.id)
  end

  def unfollow(other_artist)
    active_artist_bookmarks.find_by(follow_id: other_artist.id)
  end

  # アーティスト：ユーザーのフォロー、アンフォロー
  def user_follow(other_artist)
    front_artist_bookmarks.create(following_id: other_artist.id)
  end

  def user_unfollow(other_artist)
    front_artist_bookmarks.find_by(following_id: other_artist.id)
  end
end
