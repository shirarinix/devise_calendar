class Event < ApplicationRecord
  belongs_to :user
  belongs_to :artist

  # def user
  #   return User.find_by(id:self.user_id)
  # end
end
