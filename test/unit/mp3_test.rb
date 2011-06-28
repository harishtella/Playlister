require 'test_helper'

class Mp3Test < ActiveSupport::TestCase
  test "average_rating" do
    assert_equal(mp3s(:one).average_rating, 4) 
    assert_equal(mp3s(:two).average_rating, nil) 
  end

  test "average_rating_s" do
    assert_kind_of(String, mp3s(:one).average_rating_s)
    assert_kind_of(String, mp3s(:two).average_rating_s)
  end

  test "url_short" do
    assert_equal(mp3s(:two).url_short, 'www.mfiles.co.uk')
  end

  test "from_artists" do
    trial = Mp3.from_artists(['Johann Pachelbel', 'Beethoven'])
    expected = [mp3s(:one), mp3s(:two)]
  
    trial.sort { |x, y| x.artist_name <=> y.artist_name}
    expected.sort { |x, y| x.artist_name <=> y.artist_name}
    assert_equal(trial, expected)
  end

  test "shouldn't save without url" do
    m = Mp3.new 
    m.title = 'A good song'
    m.artist_name = 'A good artist'
    m.length = 120
    assert !m.save
  end

  test "shouldn't save without length" do
    m = Mp3.new 
    m.title = 'A good song'
    m.artist_name = 'A good artist'
    m.url = 'http://www.music.com/song.mp3'
    assert !m.save
  end

  test "shouldn't save without artist_name" do
    m = Mp3.new 
    m.title = 'A good song'
    m.length = 120
    m.url = 'http://www.music.com/song.mp3'
    assert !m.save
  end

  test "shouldn't save without title" do
    m = Mp3.new 
    m.artist_name = 'A good artist'
    m.length = 120
    m.url = 'http://www.music.com/song.mp3'
    assert !m.save
  end

  test "shouldn't save without integer length" do
    m = Mp3.new 
    m.title = 'A good song'
    m.artist_name = 'A good artist'
    m.length = 120.98
    m.url = 'http://www.music.com/song.mp3'
    assert !m.save
  end

  test "shouldn't save with bad url" do
    m = Mp3.new 
    m.title = 'A good song'
    m.artist_name = 'A good artist'
    m.length = 120.98
    m.url = 'music.rom/song.mp3'
    assert !m.save
  end
end
