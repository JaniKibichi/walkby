require 'test_helper'

class PickcallsControllerTest < ActionController::TestCase
  setup do
    @pickcall = pickcalls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pickcalls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pickcall" do
    assert_difference('Pickcall.count') do
      post :create, pickcall: { amount: @pickcall.amount, apikey: @pickcall.apikey, callerNumber: @pickcall.callerNumber, currencyCode: @pickcall.currencyCode, destinationNumber: @pickcall.destinationNumber, direction: @pickcall.direction, dtmfDigits: @pickcall.dtmfDigits, durationInSeconds: @pickcall.durationInSeconds, isActive: @pickcall.isActive, recordingUrl: @pickcall.recordingUrl, sessionId: @pickcall.sessionId, username: @pickcall.username }
    end

    assert_redirected_to pickcall_path(assigns(:pickcall))
  end

  test "should show pickcall" do
    get :show, id: @pickcall
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pickcall
    assert_response :success
  end

  test "should update pickcall" do
    patch :update, id: @pickcall, pickcall: { amount: @pickcall.amount, apikey: @pickcall.apikey, callerNumber: @pickcall.callerNumber, currencyCode: @pickcall.currencyCode, destinationNumber: @pickcall.destinationNumber, direction: @pickcall.direction, dtmfDigits: @pickcall.dtmfDigits, durationInSeconds: @pickcall.durationInSeconds, isActive: @pickcall.isActive, recordingUrl: @pickcall.recordingUrl, sessionId: @pickcall.sessionId, username: @pickcall.username }
    assert_redirected_to pickcall_path(assigns(:pickcall))
  end

  test "should destroy pickcall" do
    assert_difference('Pickcall.count', -1) do
      delete :destroy, id: @pickcall
    end

    assert_redirected_to pickcalls_path
  end
end
