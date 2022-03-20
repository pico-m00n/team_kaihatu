require "test_helper"

class CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get mypage" do
    get customers_mypage_url
    assert_response :success
  end

  test "should get mypage_edit" do
    get customers_mypage_edit_url
    assert_response :success
  end
end
