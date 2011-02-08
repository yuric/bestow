require 'test_helper'

class AdministratorControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get details" do
    get :details
    assert_response :success
  end

end
