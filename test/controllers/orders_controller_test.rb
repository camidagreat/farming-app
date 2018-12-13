require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get orders_url
    assert_response :success
  end

  test "should get new" do
    get new_order_url
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post orders_url, params: { order: { buyer_id: @order.buyer_id, farmer_id: @order.farmer_id, has_been_picked_up: @order.has_been_picked_up, location_id: @order.location_id, pick_up_lat: @order.pick_up_lat, pick_up_lng: @order.pick_up_lng, pick_up_location_name: @order.pick_up_location_name } }
    end

    assert_redirected_to order_url(Order.last)
  end

  test "should show order" do
    get order_url(@order)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_url(@order)
    assert_response :success
  end

  test "should update order" do
    patch order_url(@order), params: { order: { buyer_id: @order.buyer_id, farmer_id: @order.farmer_id, has_been_picked_up: @order.has_been_picked_up, location_id: @order.location_id, pick_up_lat: @order.pick_up_lat, pick_up_lng: @order.pick_up_lng, pick_up_location_name: @order.pick_up_location_name } }
    assert_redirected_to order_url(@order)
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete order_url(@order)
    end

    assert_redirected_to orders_url
  end
end
