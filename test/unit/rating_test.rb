require 'test_helper'

class RatingTest < ActiveSupport::TestCase
  test "must belong to mp3" do
    r = Rating.new
    r.value = 3
    assert !r.save
  end

  test "value must be integer" do
    r = Rating.new
    r.mp3_id = 1
    # model auto converts string to int, should be ok
    r.value = '3'
    assert r.save

    # this float should fail
    r.value = 1.5
    assert !r.save
  end
end
