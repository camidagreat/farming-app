require 'test_helper'

class FarmLocationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @farm_location = farm_locations(:one)
  end

  test "should get index" do
    get farm_locations_url
    assert_response :success
  end

  test "should get new" do
    get new_farm_location_url
    assert_response :success
  end

  test "should create farm_location" do
    assert_difference('FarmLocation.count') do
      post farm_locations_url, params: { farm_location: { close_time: @farm_location.close_time, email: @farm_location.email, farmer_id: @farm_location.farmer_id, location_address: @farm_location.location_address, location_lat: @farm_location.location_lat, location_lng: @farm_location.location_lng, name: @farm_location.name, open_time: @farm_location.open_time, phone_number: @farm_location.phone_number } }
    end

    assert_redirected_to farm_location_url(FarmLocation.last)
  end

  test "should show farm_location" do
    get farm_location_url(@farm_location)
    assert_response :success
  end

  test "should get edit" do
    get edit_farm_location_url(@farm_location)
    assert_response :success
  end

  test "should update farm_location" do
    patch farm_location_url(@farm_location), params: { farm_location: { close_time: @farm_location.close_time, email: @farm_location.email, farmer_id: @farm_location.farmer_id, location_address: @farm_location.location_address, location_lat: @farm_location.location_lat, location_lng: @farm_location.location_lng, name: @farm_location.name, open_time: @farm_location.open_time, phone_number: @farm_location.phone_number } }
    assert_redirected_to farm_location_url(@farm_location)
  end

  test "should destroy farm_location" do
    assert_difference('FarmLocation.count', -1) do
      delete farm_location_url(@farm_location)
    end

    assert_redirected_to farm_locations_url
  end
end
