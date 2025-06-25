require "test_helper"

class FavoriteVersesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get favorite_verses_index_url
    assert_response :success
  end

  test "should get create" do
    get favorite_verses_create_url
    assert_response :success
  end

  test "should get destroy" do
    get favorite_verses_destroy_url
    assert_response :success
  end
end
