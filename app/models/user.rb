class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :artists, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmarks_artists, through: :bookmarks, source: :artist
end
