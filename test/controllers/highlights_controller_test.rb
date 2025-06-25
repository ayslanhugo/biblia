require "test_helper"

class HighlightsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get highlights_create_url
    assert_response :success
  end
end
