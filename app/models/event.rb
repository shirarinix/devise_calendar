class Event < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :artist, optional: true

  # def user
  #   return User.find_by(id:self.user_id)
  # end
end
