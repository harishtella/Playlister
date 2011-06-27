
class PlaylistController < ApplicationController

  def generate_m(mp3s)
    contents = ""
    contents << "#EXTM3U\n"

    mp3s.each do |x|
      contents << "#EXTINF:" 
      contents << x.length.to_s
      contents << ","
      contents << x.title
      contents << "\n"

      contents << x.url
      contents << "\n"
    end

    return contents
  end


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

    @mp3s.select! {|x| x.current_rating >= @min_rating}
    @mp3s.shuffle!

    playlist = generate_m(@mp3s)
    
    response.headers['Content-Type'] = 'audio/x-mpegurl'
    response.headers['Content-Disposition'] = 'attachment; filename=playlist.m3u'
    render :inline => playlist, :cache => false
  end

end
