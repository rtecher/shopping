require 'test_helper'

class SepetsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sepets_index_url
    assert_response :success
  end

  test "should get create" do
    get sepets_create_url
    assert_response :success
  end

  test "should get destroy" do
    get sepets_destroy_url
    assert_response :success
  end

end
