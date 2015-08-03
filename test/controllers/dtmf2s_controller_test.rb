require 'test_helper'

class Dtmf2sControllerTest < ActionController::TestCase
  setup do
    @dtmf2 = dtmf2s(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dtmf2s)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dtmf2" do
    assert_difference('Dtmf2.count') do
      post :create, dtmf2: { amount: @dtmf2.amount, callerNumber: @dtmf2.callerNumber, currencyCode: @dtmf2.currencyCode, destinationNumber: @dtmf2.destinationNumber, direction: @dtmf2.direction, dtmfDigits: @dtmf2.dtmfDigits, durationInSeconds: @dtmf2.durationInSeconds, isActive: @dtmf2.isActive, recordingUrl: @dtmf2.recordingUrl, sessionId: @dtmf2.sessionId }
    end

    assert_redirected_to dtmf2_path(assigns(:dtmf2))
  end

  test "should show dtmf2" do
    get :show, id: @dtmf2
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dtmf2
    assert_response :success
  end

  test "should update dtmf2" do
    patch :update, id: @dtmf2, dtmf2: { amount: @dtmf2.amount, callerNumber: @dtmf2.callerNumber, currencyCode: @dtmf2.currencyCode, destinationNumber: @dtmf2.destinationNumber, direction: @dtmf2.direction, dtmfDigits: @dtmf2.dtmfDigits, durationInSeconds: @dtmf2.durationInSeconds, isActive: @dtmf2.isActive, recordingUrl: @dtmf2.recordingUrl, sessionId: @dtmf2.sessionId }
    assert_redirected_to dtmf2_path(assigns(:dtmf2))
  end

  test "should destroy dtmf2" do
    assert_difference('Dtmf2.count', -1) do
      delete :destroy, id: @dtmf2
    end

    assert_redirected_to dtmf2s_path
  end
end
