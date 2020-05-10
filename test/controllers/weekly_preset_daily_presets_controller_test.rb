require 'test_helper'

class WeeklyPresetDailyPresetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @weekly_preset_daily_preset = weekly_preset_daily_presets(:one)
  end

  test "should get index" do
    get weekly_preset_daily_presets_url, as: :json
    assert_response :success
  end

  test "should create weekly_preset_daily_preset" do
    assert_difference('WeeklyPresetDailyPreset.count') do
      post weekly_preset_daily_presets_url, params: { weekly_preset_daily_preset: { daily_preset_id: @weekly_preset_daily_preset.daily_preset_id, day: @weekly_preset_daily_preset.day, weekly_preset_id: @weekly_preset_daily_preset.weekly_preset_id } }, as: :json
    end

    assert_response 201
  end

  test "should show weekly_preset_daily_preset" do
    get weekly_preset_daily_preset_url(@weekly_preset_daily_preset), as: :json
    assert_response :success
  end

  test "should update weekly_preset_daily_preset" do
    patch weekly_preset_daily_preset_url(@weekly_preset_daily_preset), params: { weekly_preset_daily_preset: { daily_preset_id: @weekly_preset_daily_preset.daily_preset_id, day: @weekly_preset_daily_preset.day, weekly_preset_id: @weekly_preset_daily_preset.weekly_preset_id } }, as: :json
    assert_response 200
  end

  test "should destroy weekly_preset_daily_preset" do
    assert_difference('WeeklyPresetDailyPreset.count', -1) do
      delete weekly_preset_daily_preset_url(@weekly_preset_daily_preset), as: :json
    end

    assert_response 204
  end
end
