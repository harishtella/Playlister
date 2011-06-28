require 'test_helper'

class M3UTest < ActiveSupport::TestCase
  test "generate" do
    @mp3s = []
    @mp3s << mp3s(:one)
    @mp3s << mp3s(:two)

    m3u_text = M3U.generate(@mp3s)
    m3u_expected_text = "#EXTM3U\n"
    m3u_expected_text << "#EXTINF:199,Johann Pachelbel - Canon D\n"
    m3u_expected_text << "http://www.sophiapianolesson.com/clientfiles/kevinli/Canon_(Over_a_Basso_Ostinato).mp3\n"
    m3u_expected_text << "#EXTINF:152,Beethoven - Fur Elise\n"
    m3u_expected_text << "http://www.mfiles.co.uk/mp3-downloads/Fur-Elise.mp3\n"
    
    assert_equal(m3u_text, m3u_expected_text)
  end
end

