require 'test_helper'

class DoctorCalendarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @doctor_calendar = doctor_calendars(:one)
  end

  test "should get index" do
    get doctor_calendars_url, as: :json
    assert_response :success
  end

  test "should create doctor_calendar" do
    assert_difference('DoctorCalendar.count') do
      post doctor_calendars_url, params: { doctor_calendar: { end_time: @doctor_calendar.end_time, speciality_name: @doctor_calendar.speciality_name, start_time: @doctor_calendar.start_time, status: @doctor_calendar.status } }, as: :json
    end

    assert_response 201
  end

  test "should show doctor_calendar" do
    get doctor_calendar_url(@doctor_calendar), as: :json
    assert_response :success
  end

  test "should update doctor_calendar" do
    patch doctor_calendar_url(@doctor_calendar), params: { doctor_calendar: { end_time: @doctor_calendar.end_time, speciality_name: @doctor_calendar.speciality_name, start_time: @doctor_calendar.start_time, status: @doctor_calendar.status } }, as: :json
    assert_response 200
  end

  test "should destroy doctor_calendar" do
    assert_difference('DoctorCalendar.count', -1) do
      delete doctor_calendar_url(@doctor_calendar), as: :json
    end

    assert_response 204
  end
end
