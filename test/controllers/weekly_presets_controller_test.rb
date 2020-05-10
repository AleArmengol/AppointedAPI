require 'test_helper'

class WeeklyPresetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @weekly_preset = weekly_presets(:one)
  end

  test "should get index" do
    get weekly_presets_url, as: :json
    assert_response :success
  end

  test "should create weekly_preset" do
    assert_difference('WeeklyPreset.count') do
      post weekly_presets_url, params: { weekly_preset: { doctor_id: @weekly_preset.doctor_id, name: @weekly_preset.name } }, as: :json
    end

    assert_response 201
  end

  test "should show weekly_preset" do
    get weekly_preset_url(@weekly_preset), as: :json
    assert_response :success
  end

  test "should update weekly_preset" do
    patch weekly_preset_url(@weekly_preset), params: { weekly_preset: { doctor_id: @weekly_preset.doctor_id, name: @weekly_preset.name } }, as: :json
    assert_response 200
  end

  test "should destroy weekly_preset" do
    assert_difference('WeeklyPreset.count', -1) do
      delete weekly_preset_url(@weekly_preset), as: :json
    end

    assert_response 204
  end
end
