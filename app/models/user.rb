class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :active_bookmarks,class_name:  "Bookmark", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_bookmarks, class_name: "Bookmark", foreign_key: "following_id", dependent: :destroy

  has_many :followings, through: :active_bookmarks, source: :following
  has_many :followers, through: :passive_bookmarks, source: :follower

  has_many :events

  # ユーザーをフォローする
  def follow(other_user)
    active_bookmarks.create(following_id: other_user.id)
  end

  # ユーザーをアンフォローする
  def unfollow(other_user)
    active_bookmarks.find_by(following_id: other_user.id).destroy
  end

  # 現在のユーザーがフォローしてたらtrueを返す  
  def following?(other_user)
    followings.include?(other_user)
  end

  # def events
  #   return Event.where(user_id: self.id)
  # end
end
