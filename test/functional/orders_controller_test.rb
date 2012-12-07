require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
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

  test "should get neworder" do
    get :neworder
    assert_response :success
  end

  test "should get getorder" do
    get :getorder
    assert_response :success
  end

  test "should get fetchallorder" do
    get :fetchallorder
    assert_response :success
  end

  test "should get updateorder" do
    get :updateorder
    assert_response :success
  end

  test "should get returnorder" do
    get :returnorder
    assert_response :success
  end

  test "should get statusorder" do
    get :statusorder
    assert_response :success
  end

  test "should get addcart" do
    get :addcart
    assert_response :success
  end

  test "should get checkout" do
    get :checkout
    assert_response :success
  end

  test "should get payment" do
    get :payment
    assert_response :success
  end

  test "should get callback" do
    get :callback
    assert_response :success
  end

  test "should get gotorder" do
    get :gotorder
    assert_response :success
  end

  test "should get fetchneworder" do
    get :fetchneworder
    assert_response :success
  end

end
