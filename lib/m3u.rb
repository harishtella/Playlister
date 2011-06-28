class M3U 

  # generates the content for an Extended M3U file
  def self.generate(mp3s)
    contents = ""
    contents << "#EXTM3U\n"

    mp3s.each do |x|
      contents << "#EXTINF:" 
      contents << x.length.to_s
      contents << ","
      contents << x.artist_name + " - " + x.title.to_s
      contents << "\n"

      contents << x.url.to_s
      contents << "\n"
    end

    return contents
  end
end

