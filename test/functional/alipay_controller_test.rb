require 'test_helper'

class AlipayControllerTest < ActionController::TestCase
  test "should get send" do
    get :send
    assert_response :success
  end

  test "should get callback" do
    get :callback
    assert_response :success
  end

  test "should get notify" do
    get :notify
    assert_response :success
  end

end
