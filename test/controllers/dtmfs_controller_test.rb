require 'test_helper'

class DtmfsControllerTest < ActionController::TestCase
  setup do
    @dtmf = dtmfs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dtmfs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dtmf" do
    assert_difference('Dtmf.count') do
      post :create, dtmf: { amount: @dtmf.amount, callerNumber: @dtmf.callerNumber, currencyCode: @dtmf.currencyCode, destinationNumber: @dtmf.destinationNumber, direction: @dtmf.direction, dtmfDigits: @dtmf.dtmfDigits, durationInSeconds: @dtmf.durationInSeconds, isActive: @dtmf.isActive, recordingUrl: @dtmf.recordingUrl, sessionId: @dtmf.sessionId }
    end

    assert_redirected_to dtmf_path(assigns(:dtmf))
  end

  test "should show dtmf" do
    get :show, id: @dtmf
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dtmf
    assert_response :success
  end

  test "should update dtmf" do
    patch :update, id: @dtmf, dtmf: { amount: @dtmf.amount, callerNumber: @dtmf.callerNumber, currencyCode: @dtmf.currencyCode, destinationNumber: @dtmf.destinationNumber, direction: @dtmf.direction, dtmfDigits: @dtmf.dtmfDigits, durationInSeconds: @dtmf.durationInSeconds, isActive: @dtmf.isActive, recordingUrl: @dtmf.recordingUrl, sessionId: @dtmf.sessionId }
    assert_redirected_to dtmf_path(assigns(:dtmf))
  end

  test "should destroy dtmf" do
    assert_difference('Dtmf.count', -1) do
      delete :destroy, id: @dtmf
    end

    assert_redirected_to dtmfs_path
  end
end
