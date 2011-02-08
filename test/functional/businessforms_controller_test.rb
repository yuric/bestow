require 'test_helper'

class BusinessformsControllerTest < ActionController::TestCase
  setup do
    @businessform = businessforms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:businessforms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create businessform" do
    assert_difference('Businessform.count') do
      post :create, :businessform => @businessform.attributes
    end

    assert_redirected_to businessform_path(assigns(:businessform))
  end

  test "should show businessform" do
    get :show, :id => @businessform.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @businessform.to_param
    assert_response :success
  end

  test "should update businessform" do
    put :update, :id => @businessform.to_param, :businessform => @businessform.attributes
    assert_redirected_to businessform_path(assigns(:businessform))
  end

  test "should destroy businessform" do
    assert_difference('Businessform.count', -1) do
      delete :destroy, :id => @businessform.to_param
    end

    assert_redirected_to businessforms_path
  end
end
