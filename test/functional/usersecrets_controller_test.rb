require 'test_helper'

class UsersecretsControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    @usersecret = usersecrets(:one)
  end

  test "should get index" do
    get :index, :user_id => @user
    assert_response :success
    assert_not_nil assigns(:usersecrets)
  end

  test "should get new" do
    get :new, :user_id => @user
    assert_response :success
  end

  test "should create usersecret" do
    assert_difference('Usersecret.count') do
      post :create, :user_id => @user, :usersecret => @usersecret.attributes
    end

    assert_redirected_to user_usersecret_path(@user, assigns(:usersecret))
  end

  test "should show usersecret" do
    get :show, :user_id => @user, :id => @usersecret.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :user_id => @user, :id => @usersecret.to_param
    assert_response :success
  end

  test "should update usersecret" do
    put :update, :user_id => @user, :id => @usersecret.to_param, :usersecret => @usersecret.attributes
    assert_redirected_to user_usersecret_path(@user, assigns(:usersecret))
  end

  test "should destroy usersecret" do
    assert_difference('Usersecret.count', -1) do
      delete :destroy, :user_id => @user, :id => @usersecret.to_param
    end

    assert_redirected_to user_usersecrets_path(@user)
  end
end
