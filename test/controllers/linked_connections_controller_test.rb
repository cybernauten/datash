require 'test_helper'

class LinkedConnectionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get linked_connections_index_url
    assert_response :success
  end

  test "should get show" do
    get linked_connections_show_url
    assert_response :success
  end

  test "should get create" do
    get linked_connections_create_url
    assert_response :success
  end

  test "should get update" do
    get linked_connections_update_url
    assert_response :success
  end

end
