require 'test_helper'

class UnsubscribeControllerTest < ActionController::TestCase
  test "should get nomoreemailforyou" do
    get :nomoreemailforyou
    assert_response :success
  end

  test "should get resubscribe" do
    get :resubscribe
    assert_response :success
  end

end
