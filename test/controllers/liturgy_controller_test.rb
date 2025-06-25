require "test_helper"

class LiturgyControllerTest < ActionDispatch::IntegrationTest
  test "should get show_today" do
    get liturgy_show_today_url
    assert_response :success
  end
end
