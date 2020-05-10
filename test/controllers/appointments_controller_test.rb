require 'test_helper'

class AppointmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @appointment = appointments(:one)
  end

  test "should get index" do
    get appointments_url, as: :json
    assert_response :success
  end

  test "should create appointment" do
    assert_difference('Appointment.count') do
      post appointments_url, params: { appointment: { date: @appointment.date, doctor_id: @appointment.doctor_id, doctor_name: @appointment.doctor_name, end_time: @appointment.end_time, length: @appointment.length, name: @appointment.name, patient_id: @appointment.patient_id, patient_name: @appointment.patient_name, speciality_name: @appointment.speciality_name, start_time: @appointment.start_time, status: @appointment.status } }, as: :json
    end

    assert_response 201
  end

  test "should show appointment" do
    get appointment_url(@appointment), as: :json
    assert_response :success
  end

  test "should update appointment" do
    patch appointment_url(@appointment), params: { appointment: { date: @appointment.date, doctor_id: @appointment.doctor_id, doctor_name: @appointment.doctor_name, end_time: @appointment.end_time, length: @appointment.length, name: @appointment.name, patient_id: @appointment.patient_id, patient_name: @appointment.patient_name, speciality_name: @appointment.speciality_name, start_time: @appointment.start_time, status: @appointment.status } }, as: :json
    assert_response 200
  end

  test "should destroy appointment" do
    assert_difference('Appointment.count', -1) do
      delete appointment_url(@appointment), as: :json
    end

    assert_response 204
  end
end
