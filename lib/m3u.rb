class M3U 
  def self.generate(mp3s)
    contents = ""
    contents << "#EXTM3U\n"

    mp3s.each do |x|
      contents << "#EXTINF:" 
      contents << x.length.to_s
      contents << ","
      contents << x.title.to_s
      contents << "\n"

      contents << x.url.to_s
      contents << "\n"
    end

    return contents
  end
end

