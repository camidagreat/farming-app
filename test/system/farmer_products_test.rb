require "application_system_test_case"

class FarmerProductsTest < ApplicationSystemTestCase
  setup do
    @farmer_product = farmer_products(:one)
  end

  test "visiting the index" do
    visit farmer_products_url
    assert_selector "h1", text: "Farmer Products"
  end

  test "creating a Farmer product" do
    visit farmer_products_url
    click_on "New Farmer Product"

    fill_in "Farmer", with: @farmer_product.farmer_id
    fill_in "Price", with: @farmer_product.price
    fill_in "Product", with: @farmer_product.product_id
    fill_in "Size", with: @farmer_product.size
    click_on "Create Farmer product"

    assert_text "Farmer product was successfully created"
    click_on "Back"
  end

  test "updating a Farmer product" do
    visit farmer_products_url
    click_on "Edit", match: :first

    fill_in "Farmer", with: @farmer_product.farmer_id
    fill_in "Price", with: @farmer_product.price
    fill_in "Product", with: @farmer_product.product_id
    fill_in "Size", with: @farmer_product.size
    click_on "Update Farmer product"

    assert_text "Farmer product was successfully updated"
    click_on "Back"
  end

  test "destroying a Farmer product" do
    visit farmer_products_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Farmer product was successfully destroyed"
  end
end
