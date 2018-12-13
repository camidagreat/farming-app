require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase
  setup do
    @order = orders(:one)
  end

  test "visiting the index" do
    visit orders_url
    assert_selector "h1", text: "Orders"
  end

  test "creating a Order" do
    visit orders_url
    click_on "New Order"

    fill_in "Buyer", with: @order.buyer_id
    fill_in "Farmer", with: @order.farmer_id
    fill_in "Has been picked up", with: @order.has_been_picked_up
    fill_in "Location", with: @order.location_id
    fill_in "Pick up lat", with: @order.pick_up_lat
    fill_in "Pick up lng", with: @order.pick_up_lng
    fill_in "Pick up location name", with: @order.pick_up_location_name
    click_on "Create Order"

    assert_text "Order was successfully created"
    click_on "Back"
  end

  test "updating a Order" do
    visit orders_url
    click_on "Edit", match: :first

    fill_in "Buyer", with: @order.buyer_id
    fill_in "Farmer", with: @order.farmer_id
    fill_in "Has been picked up", with: @order.has_been_picked_up
    fill_in "Location", with: @order.location_id
    fill_in "Pick up lat", with: @order.pick_up_lat
    fill_in "Pick up lng", with: @order.pick_up_lng
    fill_in "Pick up location name", with: @order.pick_up_location_name
    click_on "Update Order"

    assert_text "Order was successfully updated"
    click_on "Back"
  end

  test "destroying a Order" do
    visit orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Order was successfully destroyed"
  end
end
