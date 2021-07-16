require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get my_portfoloio" do
    get users_my_portfoloio_url
    assert_response :success
  end
end
