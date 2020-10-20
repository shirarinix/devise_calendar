class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :artist

  validates :user_id, uniqueness: { scope: :artist_id } # 一意性制限
  # validates :artist_id, uniqueness: { scope: :user_id }
end
