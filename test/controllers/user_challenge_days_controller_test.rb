require "test_helper"

class UserChallengeDaysControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get user_challenge_days_create_url
    assert_response :success
  end

  test "should get destroy" do
    get user_challenge_days_destroy_url
    assert_response :success
  end
end
