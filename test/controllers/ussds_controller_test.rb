require 'test_helper'

class UssdsControllerTest < ActionController::TestCase
  setup do
    @ussd = ussds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ussds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ussd" do
    assert_difference('Ussd.count') do
      post :create, ussd: { phoneNumber: @ussd.phoneNumber, serviceCode: @ussd.serviceCode, sessionId: @ussd.sessionId }
    end

    assert_redirected_to ussd_path(assigns(:ussd))
  end

  test "should show ussd" do
    get :show, id: @ussd
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ussd
    assert_response :success
  end

  test "should update ussd" do
    patch :update, id: @ussd, ussd: { phoneNumber: @ussd.phoneNumber, serviceCode: @ussd.serviceCode, sessionId: @ussd.sessionId }
    assert_redirected_to ussd_path(assigns(:ussd))
  end

  test "should destroy ussd" do
    assert_difference('Ussd.count', -1) do
      delete :destroy, id: @ussd
    end

    assert_redirected_to ussds_path
  end
end
