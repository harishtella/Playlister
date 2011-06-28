require 'test_helper'

class PlaylistControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:artists)
  end

  test "should generate playlist" do
    post :generate, :artists => ["Beethoven", "Johann Pachelbel"],
      :min_rating => '2'
    assert_response :success
    assert_not_nil assigns(:mp3s)
    assert_equal(@response.content_type, 'audio/x-mpegurl')
  end

  test "should generate playlist also" do
    post :generate, :artists => nil,
      :min_rating => '-1'
    assert_response :success
    assert_not_nil assigns(:mp3s)
    assert_equal(@response.content_type, 'audio/x-mpegurl')
  end

  test "when no songs match criteria" do
    post :generate, :artists => ["Beethoven"],
      :min_rating => '5'
    assert_redirected_to '/playlist/index'
    assert_not_nil assigns(:mp3s)
    assert_not_nil flash[:error]
  end

end
