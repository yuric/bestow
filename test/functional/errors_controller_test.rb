require 'test_helper'

class ErrorsControllerTest < ActionController::TestCase
  test "should get notfound404" do
    get :notfound404
    assert_response :success
  end

  test "should get authorizednot" do
    get :authorizednot
    assert_response :success
  end

end
