require 'test_helper'

class FoocancansControllerTest < ActionController::TestCase
  setup do
    @foocancan = foocancans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:foocancans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create foocancan" do
    assert_difference('Foocancan.count') do
      post :create, :foocancan => @foocancan.attributes
    end

    assert_redirected_to foocancan_path(assigns(:foocancan))
  end

  test "should show foocancan" do
    get :show, :id => @foocancan.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @foocancan.to_param
    assert_response :success
  end

  test "should update foocancan" do
    put :update, :id => @foocancan.to_param, :foocancan => @foocancan.attributes
    assert_redirected_to foocancan_path(assigns(:foocancan))
  end

  test "should destroy foocancan" do
    assert_difference('Foocancan.count', -1) do
      delete :destroy, :id => @foocancan.to_param
    end

    assert_redirected_to foocancans_path
  end
end
