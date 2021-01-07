class Bookmark < ApplicationRecord
  belongs_to :following, class_name: 'User', optional: true # class_nameで参照するモデルを指定
  belongs_to :follower, class_name: 'User', optional: true

  belongs_to :follow, class_name: 'Artist', optional: true
  belongs_to :followed, class_name: 'Artist', optional: true

  validates :following_id, uniqueness: { scope: [:follower_id, :follow_id, :followed_id], message: 'エラー発生' }
end
