require 'test_helper'

class FarmerProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @farmer_product = farmer_products(:one)
  end

  test "should get index" do
    get farmer_products_url
    assert_response :success
  end

  test "should get new" do
    get new_farmer_product_url
    assert_response :success
  end

  test "should create farmer_product" do
    assert_difference('FarmerProduct.count') do
      post farmer_products_url, params: { farmer_product: { farmer_id: @farmer_product.farmer_id, price: @farmer_product.price, product_id: @farmer_product.product_id, size: @farmer_product.size } }
    end

    assert_redirected_to farmer_product_url(FarmerProduct.last)
  end

  test "should show farmer_product" do
    get farmer_product_url(@farmer_product)
    assert_response :success
  end

  test "should get edit" do
    get edit_farmer_product_url(@farmer_product)
    assert_response :success
  end

  test "should update farmer_product" do
    patch farmer_product_url(@farmer_product), params: { farmer_product: { farmer_id: @farmer_product.farmer_id, price: @farmer_product.price, product_id: @farmer_product.product_id, size: @farmer_product.size } }
    assert_redirected_to farmer_product_url(@farmer_product)
  end

  test "should destroy farmer_product" do
    assert_difference('FarmerProduct.count', -1) do
      delete farmer_product_url(@farmer_product)
    end

    assert_redirected_to farmer_products_url
  end
end
