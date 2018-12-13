require "application_system_test_case"

class FarmLocationsTest < ApplicationSystemTestCase
  setup do
    @farm_location = farm_locations(:one)
  end

  test "visiting the index" do
    visit farm_locations_url
    assert_selector "h1", text: "Farm Locations"
  end

  test "creating a Farm location" do
    visit farm_locations_url
    click_on "New Farm Location"

    fill_in "Close time", with: @farm_location.close_time
    fill_in "Email", with: @farm_location.email
    fill_in "Farmer", with: @farm_location.farmer_id
    fill_in "Location address", with: @farm_location.location_address
    fill_in "Location lat", with: @farm_location.location_lat
    fill_in "Location lng", with: @farm_location.location_lng
    fill_in "Name", with: @farm_location.name
    fill_in "Open time", with: @farm_location.open_time
    fill_in "Phone number", with: @farm_location.phone_number
    click_on "Create Farm location"

    assert_text "Farm location was successfully created"
    click_on "Back"
  end

  test "updating a Farm location" do
    visit farm_locations_url
    click_on "Edit", match: :first

    fill_in "Close time", with: @farm_location.close_time
    fill_in "Email", with: @farm_location.email
    fill_in "Farmer", with: @farm_location.farmer_id
    fill_in "Location address", with: @farm_location.location_address
    fill_in "Location lat", with: @farm_location.location_lat
    fill_in "Location lng", with: @farm_location.location_lng
    fill_in "Name", with: @farm_location.name
    fill_in "Open time", with: @farm_location.open_time
    fill_in "Phone number", with: @farm_location.phone_number
    click_on "Update Farm location"

    assert_text "Farm location was successfully updated"
    click_on "Back"
  end

  test "destroying a Farm location" do
    visit farm_locations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Farm location was successfully destroyed"
  end
end
