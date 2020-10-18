class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many :artists, throuth: :users_artists
  
  # belongs_to :artists, optional: true
  has_many :users_artists, dependent: :destroy
end
