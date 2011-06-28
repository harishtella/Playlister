require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
  fixtures :all

  test "add an mp3" do
    @mp3 = mp3s(:one) 

    get "/"
    assert_response :success
    get "/mp3s/new"
    assert_response :success
    post_via_redirect("/mp3s", :mp3 => @mp3.attributes)
    assert_equal("/mp3s/#{assigns(:mp3).to_param}", path)
  end

  test "add a rating" do
    @rating = ratings(:unattached_to_mp3)

    get "/"
    assert_response :success
    get "/mp3s/1"
    assert_response :success
    post_via_redirect("/mp3s/1/rate", :id => @mp3.to_param,
                     :rating => @rating)
    assert_equal("/mp3s/1", path)
  end

  test "edit a mp3" do
    @mp3 = mp3s(:two)

    get "/"
    assert_response :success
    get "/mp3s/1"
    assert_response :success
    get "/mp3s/1/edit"
    assert_response :success
    put_via_redirect("/mp3s/1", :mp3 => @mp3.to_param)
    assert_equal("/mp3s/1", path)
  end

  test "generate a playlist" do
    get "/"
    assert_response :success
    get "/playlist/index"
    assert_response :success
    post_via_redirect("/playlist/generate", :artists => nil,
                     :minimum_rating => '-1')
    assert_response :success
  end
end
