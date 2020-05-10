require 'test_helper'

class SpecialitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @speciality = specialities(:one)
  end

  test "should get index" do
    get specialities_url, as: :json
    assert_response :success
  end

  test "should create speciality" do
    assert_difference('Speciality.count') do
      post specialities_url, params: { speciality: { name: @speciality.name } }, as: :json
    end

    assert_response 201
  end

  test "should show speciality" do
    get speciality_url(@speciality), as: :json
    assert_response :success
  end

  test "should update speciality" do
    patch speciality_url(@speciality), params: { speciality: { name: @speciality.name } }, as: :json
    assert_response 200
  end

  test "should destroy speciality" do
    assert_difference('Speciality.count', -1) do
      delete speciality_url(@speciality), as: :json
    end

    assert_response 204
  end
end
