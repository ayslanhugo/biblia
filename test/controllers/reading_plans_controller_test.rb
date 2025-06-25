require "test_helper"

class ReadingPlansControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get reading_plans_index_url
    assert_response :success
  end

  test "should get show" do
    get reading_plans_show_url
    assert_response :success
  end
end
