require 'test_helper'

class CouponSearchesControllerTest < ActionController::TestCase
  setup do
    @coupon_search = coupon_searches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:coupon_searches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create coupon_search" do
    assert_difference('CouponSearch.count') do
      post :create, :coupon_search => @coupon_search.attributes
    end

    assert_redirected_to coupon_search_path(assigns(:coupon_search))
  end

  test "should show coupon_search" do
    get :show, :id => @coupon_search.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @coupon_search.to_param
    assert_response :success
  end

  test "should update coupon_search" do
    put :update, :id => @coupon_search.to_param, :coupon_search => @coupon_search.attributes
    assert_redirected_to coupon_search_path(assigns(:coupon_search))
  end

  test "should destroy coupon_search" do
    assert_difference('CouponSearch.count', -1) do
      delete :destroy, :id => @coupon_search.to_param
    end

    assert_redirected_to coupon_searches_path
  end
end
