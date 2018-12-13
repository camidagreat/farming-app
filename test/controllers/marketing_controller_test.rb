require 'test_helper'

class MarketingControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get marketing_home_url
    assert_response :success
  end

  test "should get about" do
    get marketing_about_url
    assert_response :success
  end

  test "should get contact" do
    get marketing_contact_url
    assert_response :success
  end

  test "should get sign_in" do
    get marketing_sign_in_url
    assert_response :success
  end

  test "should get sign_up" do
    get marketing_sign_up_url
    assert_response :success
  end

end
