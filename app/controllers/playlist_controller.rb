require 'M3U'

class PlaylistController < ApplicationController
  def index
    @artists = Mp3.find(:all).map {|x| x.artist_name}
    @artists.uniq!
  end

  def generate
    @artists = params[:artists]
    @min_rating = params[:min_rating].to_i

    unless @artists.nil?
      @mp3s = Mp3.from_artists(@artists)
    else 
      @mp3s = Mp3.find(:all)
    end

    @mp3s.select! {|x| x.average_rating >= @min_rating}
    @mp3s.shuffle!

    playlist = M3U.generate(@mp3s)
    
    response.headers['Content-Type'] = 'audio/x-mpegurl'
    response.headers['Content-Disposition'] = 'attachment; filename=playlist.m3u'
    render :inline => playlist, :cache => false
  end
end
