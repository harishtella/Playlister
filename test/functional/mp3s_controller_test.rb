require 'test_helper'

class Mp3sControllerTest < ActionController::TestCase
  setup do
    @mp3 = mp3s(:one)
    @rating = ratings(:unattached_to_mp3)
  end

  test "should create rating" do
    assert_difference("Mp3.find(#{@mp3.to_param}).ratings.count") do
      post :create_rating, :id => @mp3.to_param, 
        :rating => @rating.attributes 
      assert_redirected_to mp3_path(assigns(:mp3))
    end
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mp3s)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mp3" do
    assert_difference('Mp3.count') do
      post :create, :mp3 => @mp3.attributes
    end

    assert_redirected_to mp3_path(assigns(:mp3))
  end

  test "should show mp3" do
    get :show, :id => @mp3.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @mp3.to_param
    assert_response :success
  end

  test "should update mp3" do
    put :update, :id => @mp3.to_param, :mp3 => @mp3.attributes
    assert_redirected_to mp3_path(assigns(:mp3))
  end

  test "should destroy mp3" do
    assert_difference('Mp3.count', -1) do
      delete :destroy, :id => @mp3.to_param
    end

    assert_redirected_to mp3s_path
  end
end
