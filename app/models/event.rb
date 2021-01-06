class Event < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :artist, optional: true

  validates :title, presence: true, length: { maximum: 20 }
  validates :content, presence: true, length: { maximum: 100 }
  validates :start_time, presence: true
end
