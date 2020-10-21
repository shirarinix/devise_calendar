class Artist < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :user
  # has_many :users, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  # has_many :bookmarks_users, through: :bookmarks, source: :user

  # boardのお気に入り判定 → vies側で呼び出し
  def bookmark_by?(user)
    bookmarks.where(user_id: user.id).exists?
  end
end
