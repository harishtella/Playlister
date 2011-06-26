class PlaylistController < ApplicationController

  def index
    @artists = Mp3.find(:all).map {|x| x.artist_name}
    @artists.uniq!
  end

  def generate
  end

end
