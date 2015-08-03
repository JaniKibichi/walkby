require 'test_helper'

class KeysallsControllerTest < ActionController::TestCase
  setup do
    @keysall = keysalls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:keysalls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create keysall" do
    assert_difference('Keysall.count') do
      post :create, keysall: {  }
    end

    assert_redirected_to keysall_path(assigns(:keysall))
  end

  test "should show keysall" do
    get :show, id: @keysall
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @keysall
    assert_response :success
  end

  test "should update keysall" do
    patch :update, id: @keysall, keysall: {  }
    assert_redirected_to keysall_path(assigns(:keysall))
  end

  test "should destroy keysall" do
    assert_difference('Keysall.count', -1) do
      delete :destroy, id: @keysall
    end

    assert_redirected_to keysalls_path
  end
end
