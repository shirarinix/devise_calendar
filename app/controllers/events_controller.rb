class EventsController < ApplicationController
  def index
    @user = User.all
    @artist = Artist.all
  end
end
