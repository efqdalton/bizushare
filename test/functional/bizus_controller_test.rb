require 'test_helper'

class BizusControllerTest < ActionController::TestCase
  setup do
    @bizu = bizus(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bizus)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bizu" do
    assert_difference('Bizu.count') do
      post :create, :bizu => @bizu.attributes
    end

    assert_redirected_to bizu_path(assigns(:bizu))
  end

  test "should show bizu" do
    get :show, :id => @bizu.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @bizu.to_param
    assert_response :success
  end

  test "should update bizu" do
    put :update, :id => @bizu.to_param, :bizu => @bizu.attributes
    assert_redirected_to bizu_path(assigns(:bizu))
  end

  test "should destroy bizu" do
    assert_difference('Bizu.count', -1) do
      delete :destroy, :id => @bizu.to_param
    end

    assert_redirected_to bizus_path
  end
end
