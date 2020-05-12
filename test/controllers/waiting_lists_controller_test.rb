require 'test_helper'

class WaitingListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @waiting_list = waiting_lists(:one)
  end

  test "should get index" do
    get waiting_lists_url, as: :json
    assert_response :success
  end

  test "should create waiting_list" do
    assert_difference('WaitingList.count') do
      post waiting_lists_url, params: { waiting_list: { doctor_id: @waiting_list.doctor_id, patient_id: @waiting_list.patient_id, speciality_id: @waiting_list.speciality_id } }, as: :json
    end

    assert_response 201
  end

  test "should show waiting_list" do
    get waiting_list_url(@waiting_list), as: :json
    assert_response :success
  end

  test "should update waiting_list" do
    patch waiting_list_url(@waiting_list), params: { waiting_list: { doctor_id: @waiting_list.doctor_id, patient_id: @waiting_list.patient_id, speciality_id: @waiting_list.speciality_id } }, as: :json
    assert_response 200
  end

  test "should destroy waiting_list" do
    assert_difference('WaitingList.count', -1) do
      delete waiting_list_url(@waiting_list), as: :json
    end

    assert_response 204
  end
end
