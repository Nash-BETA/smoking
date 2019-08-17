require 'test_helper'

class StoreControllerTest < ActionDispatch::IntegrationTest
  test "should get detail" do
    get store_detail_url
    assert_response :success
  end

end
