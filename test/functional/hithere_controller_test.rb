require 'test_helper'

class HithereControllerTest < ActionController::TestCase
  test "should get contact" do
    get :contact
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get feedback" do
    get :feedback
    assert_response :success
  end

  test "should get errorpage" do
    get :errorpage
    assert_response :success
  end
  
  test "should get chat" do
    get :chat
    assert_response :success
  end

end
