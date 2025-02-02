require 'test_helper'

class DoctorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @doctor = doctors(:one)
  end

  test "should get index" do
    get doctors_url, as: :json
    assert_response :success
  end

  test "should create doctor" do
    assert_difference('Doctor.count') do
      post doctors_url, params: { doctor: { address: @doctor.address, email: @doctor.email, last_name: @doctor.last_name, name: @doctor.name, phone_number: @doctor.phone_number } }, as: :json
    end

    assert_response 201
  end

  test "should show doctor" do
    get doctor_url(@doctor), as: :json
    assert_response :success
  end

  test "should update doctor" do
    patch doctor_url(@doctor), params: { doctor: { address: @doctor.address, email: @doctor.email, last_name: @doctor.last_name, name: @doctor.name, phone_number: @doctor.phone_number } }, as: :json
    assert_response 200
  end

  test "should destroy doctor" do
    assert_difference('Doctor.count', -1) do
      delete doctor_url(@doctor), as: :json
    end

    assert_response 204
  end
end
