require 'test_helper'

class ProductControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get get" do
    get :get
    assert_response :success
  end

  test "should get fetchall" do
    get :fetchall
    assert_response :success
  end

  test "should get update" do
    get :update
    assert_response :success
  end

end