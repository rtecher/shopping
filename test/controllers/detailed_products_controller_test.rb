require 'test_helper'

class DetailedProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get detailed_products_index_url
    assert_response :success
  end

end
