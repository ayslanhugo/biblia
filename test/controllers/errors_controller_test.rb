require "test_helper"

class ErrorsControllerTest < ActionDispatch::IntegrationTest
  test "should get not_found" do
    get "/404" # Usamos o caminho da rota diretamente
    assert_response :success
  end

  test "should get internal_server_error" do
    get "/500" # Usamos o caminho da rota diretamente
    assert_response :success
  end
end
