require 'test_helper'

class HypotheticalsControllerTest < ActionController::TestCase
  setup do
    @hypothetical = hypotheticals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hypotheticals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hypothetical" do
    assert_difference('Hypothetical.count') do
      post :create, hypothetical: {  }
    end

    assert_redirected_to hypothetical_path(assigns(:hypothetical))
  end

  test "should show hypothetical" do
    get :show, id: @hypothetical
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hypothetical
    assert_response :success
  end

  test "should update hypothetical" do
    patch :update, id: @hypothetical, hypothetical: {  }
    assert_redirected_to hypothetical_path(assigns(:hypothetical))
  end

  test "should destroy hypothetical" do
    assert_difference('Hypothetical.count', -1) do
      delete :destroy, id: @hypothetical
    end

    assert_redirected_to hypotheticals_path
  end
end
