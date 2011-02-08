require 'test_helper'

class SimplealertsControllerTest < ActionController::TestCase
  setup do
    @simplealert = simplealerts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:simplealerts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create simplealert" do
    assert_difference('Simplealert.count') do
      post :create, :simplealert => @simplealert.attributes
    end

    assert_redirected_to simplealert_path(assigns(:simplealert))
  end

  test "should show simplealert" do
    get :show, :id => @simplealert.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @simplealert.to_param
    assert_response :success
  end

  test "should update simplealert" do
    put :update, :id => @simplealert.to_param, :simplealert => @simplealert.attributes
    assert_redirected_to simplealert_path(assigns(:simplealert))
  end

  test "should destroy simplealert" do
    assert_difference('Simplealert.count', -1) do
      delete :destroy, :id => @simplealert.to_param
    end

    assert_redirected_to simplealerts_path
  end
end
