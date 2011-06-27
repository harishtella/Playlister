class M3U 

  def self.generate(mp3s)
    contents = ""
    contents << "#EXTM3U\n"

    mp3s.each do |x|
      contents << "#EXTINF:" 
      contents << x.length
      contents << ","
      contents << x.title
      contents << "\n"

      contents << x.url
      contents << "\n"
    end
  end
end

