require "test_helper"

class ConnectionControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get connection_create_url
    assert_response :success
  end
end
