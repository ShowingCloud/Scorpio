require 'test_helper'

class UserinfosControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    @userinfo = userinfos(:one)
  end

  test "should get index" do
    get :index, :user_id => @user
    assert_response :success
    assert_not_nil assigns(:userinfos)
  end

  test "should get new" do
    get :new, :user_id => @user
    assert_response :success
  end

  test "should create userinfo" do
    assert_difference('Userinfo.count') do
      post :create, :user_id => @user, :userinfo => @userinfo.attributes
    end

    assert_redirected_to user_userinfo_path(@user, assigns(:userinfo))
  end

  test "should show userinfo" do
    get :show, :user_id => @user, :id => @userinfo.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :user_id => @user, :id => @userinfo.to_param
    assert_response :success
  end

  test "should update userinfo" do
    put :update, :user_id => @user, :id => @userinfo.to_param, :userinfo => @userinfo.attributes
    assert_redirected_to user_userinfo_path(@user, assigns(:userinfo))
  end

  test "should destroy userinfo" do
    assert_difference('Userinfo.count', -1) do
      delete :destroy, :user_id => @user, :id => @userinfo.to_param
    end

    assert_redirected_to user_userinfos_path(@user)
  end
end
