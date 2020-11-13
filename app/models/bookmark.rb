class Bookmark < ApplicationRecord
  belongs_to :follower, optional: true, class_name: "User"
  belongs_to :following, optional: true, class_name: "User"

  belongs_to :artist_followed, optional: true, class_name: "Artist"
  belongs_to :artist_follow, optional: true, class_name: "Artist"

  validates :follower, uniqueness: { scope: :following }
  validates :artist_followed, uniqueness: { scope: :artist_follow }
end
