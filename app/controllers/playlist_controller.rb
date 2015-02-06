require 'm3u'

class PlaylistController < ApplicationController
  def index
    @artists = Mp3.all.map {|x| x.artist_name}
    @artists.uniq!
  end

  def generate
    @artists = params[:artists]
    @min_rating = params[:min_rating].to_i

    # unless - user didn't specify any artists
    unless @artists.nil?
      @mp3s = Mp3.from_artists(@artists)
    else 
      @mp3s = Mp3.all
    end

    # unless - 'anything' is chosen as the minimum desired rating
    unless @min_rating.eql? -1 
      @mp3s.select! {|x| not x.average_rating.nil?}
      @mp3s.select! {|x| x.average_rating >= @min_rating}
    end

    unless @mp3s.empty? 
      @mp3s.shuffle!
      playlist = M3U.generate(@mp3s)

      response.headers['Content-Type'] = 'audio/x-mpegurl'
      response.headers['Content-Disposition'] = 'attachment; filename=playlist.m3u'
      render :inline => playlist, :cache => false
    else
      flash[:error] = "No songs matched your criteria, try choosing a lower rating."
      redirect_to '/playlist/index'
    end
  end
end
