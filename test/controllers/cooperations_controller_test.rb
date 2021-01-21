require 'test_helper'

class CooperationsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get cooperations_create_url
    assert_response :success
  end

  test "should get update" do
    get cooperations_update_url
    assert_response :success
  end

end
