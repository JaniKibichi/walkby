require 'test_helper'

class AirtimesControllerTest < ActionController::TestCase
  setup do
    @airtime = airtimes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:airtimes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create airtime" do
    assert_difference('Airtime.count') do
      post :create, airtime: { amount: @airtime.amount, discount: @airtime.discount, phoneNumber: @airtime.phoneNumber, requestId: @airtime.requestId, status: @airtime.status }
    end

    assert_redirected_to airtime_path(assigns(:airtime))
  end

  test "should show airtime" do
    get :show, id: @airtime
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @airtime
    assert_response :success
  end

  test "should update airtime" do
    patch :update, id: @airtime, airtime: { amount: @airtime.amount, discount: @airtime.discount, phoneNumber: @airtime.phoneNumber, requestId: @airtime.requestId, status: @airtime.status }
    assert_redirected_to airtime_path(assigns(:airtime))
  end

  test "should destroy airtime" do
    assert_difference('Airtime.count', -1) do
      delete :destroy, id: @airtime
    end

    assert_redirected_to airtimes_path
  end
end
