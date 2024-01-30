require "test_helper"

class CalculatorControllerTest < ActionDispatch::IntegrationTest
  test "should get main" do
    get calculator_main_url
    assert_response :success
  end
end
