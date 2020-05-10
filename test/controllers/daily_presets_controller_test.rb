require 'test_helper'

class DailyPresetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @daily_preset = daily_presets(:one)
  end

  test "should get index" do
    get daily_presets_url, as: :json
    assert_response :success
  end

  test "should create daily_preset" do
    assert_difference('DailyPreset.count') do
      post daily_presets_url, params: { daily_preset: { doctor_id: @daily_preset.doctor_id, name: @daily_preset.name, speciality_id: @daily_preset.speciality_id } }, as: :json
    end

    assert_response 201
  end

  test "should show daily_preset" do
    get daily_preset_url(@daily_preset), as: :json
    assert_response :success
  end

  test "should update daily_preset" do
    patch daily_preset_url(@daily_preset), params: { daily_preset: { doctor_id: @daily_preset.doctor_id, name: @daily_preset.name, speciality_id: @daily_preset.speciality_id } }, as: :json
    assert_response 200
  end

  test "should destroy daily_preset" do
    assert_difference('DailyPreset.count', -1) do
      delete daily_preset_url(@daily_preset), as: :json
    end

    assert_response 204
  end
end
