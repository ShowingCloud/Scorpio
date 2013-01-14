require 'test_helper'

class UseraddrsControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    @useraddr = useraddrs(:one)
  end

  test "should get index" do
    get :index, :user_id => @user
    assert_response :success
    assert_not_nil assigns(:useraddrs)
  end

  test "should get new" do
    get :new, :user_id => @user
    assert_response :success
  end

  test "should create useraddr" do
    assert_difference('Useraddr.count') do
      post :create, :user_id => @user, :useraddr => @useraddr.attributes
    end

    assert_redirected_to user_useraddr_path(@user, assigns(:useraddr))
  end

  test "should show useraddr" do
    get :show, :user_id => @user, :id => @useraddr.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :user_id => @user, :id => @useraddr.to_param
    assert_response :success
  end

  test "should update useraddr" do
    put :update, :user_id => @user, :id => @useraddr.to_param, :useraddr => @useraddr.attributes
    assert_redirected_to user_useraddr_path(@user, assigns(:useraddr))
  end

  test "should destroy useraddr" do
    assert_difference('Useraddr.count', -1) do
      delete :destroy, :user_id => @user, :id => @useraddr.to_param
    end

    assert_redirected_to user_useraddrs_path(@user)
  end
end
