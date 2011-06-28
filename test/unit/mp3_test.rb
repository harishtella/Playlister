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

  # TODO this should be done using sets 
  test "from_artists" do
    assert_equal(Mp3.from_artists(['Johann Pachelbel', 'Beethoven']), 
           [mp3s(:one), mp3s(:two)])
  end
end
