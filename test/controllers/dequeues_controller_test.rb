require 'test_helper'

class DequeuesControllerTest < ActionController::TestCase
  setup do
    @dequeue = dequeues(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dequeues)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dequeue" do
    assert_difference('Dequeue.count') do
      post :create, dequeue: { amount: @dequeue.amount, apikey: @dequeue.apikey, callerNumber: @dequeue.callerNumber, currencyCode: @dequeue.currencyCode, destinationNumber: @dequeue.destinationNumber, direction: @dequeue.direction, dtmfDigits: @dequeue.dtmfDigits, durationInSeconds: @dequeue.durationInSeconds, isActive: @dequeue.isActive, recordingUrl: @dequeue.recordingUrl, sessionId: @dequeue.sessionId, username: @dequeue.username }
    end

    assert_redirected_to dequeue_path(assigns(:dequeue))
  end

  test "should show dequeue" do
    get :show, id: @dequeue
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dequeue
    assert_response :success
  end

  test "should update dequeue" do
    patch :update, id: @dequeue, dequeue: { amount: @dequeue.amount, apikey: @dequeue.apikey, callerNumber: @dequeue.callerNumber, currencyCode: @dequeue.currencyCode, destinationNumber: @dequeue.destinationNumber, direction: @dequeue.direction, dtmfDigits: @dequeue.dtmfDigits, durationInSeconds: @dequeue.durationInSeconds, isActive: @dequeue.isActive, recordingUrl: @dequeue.recordingUrl, sessionId: @dequeue.sessionId, username: @dequeue.username }
    assert_redirected_to dequeue_path(assigns(:dequeue))
  end

  test "should destroy dequeue" do
    assert_difference('Dequeue.count', -1) do
      delete :destroy, id: @dequeue
    end

    assert_redirected_to dequeues_path
  end
end
