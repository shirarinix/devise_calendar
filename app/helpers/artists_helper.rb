module ArtistsHelper
  def current_artist?(artist)
    artist == current_artist
  end
end
