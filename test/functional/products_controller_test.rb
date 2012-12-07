require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get update" do
    get :update
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

  test "should get newproduct" do
    get :newproduct
    assert_response :success
  end

  test "should get getproduct" do
    get :getproduct
    assert_response :success
  end

  test "should get fetchallproduct" do
    get :fetchallproduct
    assert_response :success
  end

  test "should get updateproduct" do
    get :updateproduct
    assert_response :success
  end

end
