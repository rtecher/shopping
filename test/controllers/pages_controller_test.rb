require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get about_us" do
    get pages_about_us_url
    assert_response :success
  end

  test "should get communication" do
    get pages_communication_url
    assert_response :success
  end

end
