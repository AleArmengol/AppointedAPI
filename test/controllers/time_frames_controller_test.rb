require 'test_helper'

class TimeFramesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @time_frame = time_frames(:one)
  end

  test "should get index" do
    get time_frames_url, as: :json
    assert_response :success
  end

  test "should create time_frame" do
    assert_difference('TimeFrame.count') do
      post time_frames_url, params: { time_frame: { daily_preset_id: @time_frame.daily_preset_id, end_time: @time_frame.end_time, start_time: @time_frame.start_time } }, as: :json
    end

    assert_response 201
  end

  test "should show time_frame" do
    get time_frame_url(@time_frame), as: :json
    assert_response :success
  end

  test "should update time_frame" do
    patch time_frame_url(@time_frame), params: { time_frame: { daily_preset_id: @time_frame.daily_preset_id, end_time: @time_frame.end_time, start_time: @time_frame.start_time } }, as: :json
    assert_response 200
  end

  test "should destroy time_frame" do
    assert_difference('TimeFrame.count', -1) do
      delete time_frame_url(@time_frame), as: :json
    end

    assert_response 204
  end
end
