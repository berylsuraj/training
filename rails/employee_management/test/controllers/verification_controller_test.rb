require "test_helper"

class VerificationControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get verification_new_url
    assert_response :success
  end

  test "should get create" do
    get verification_create_url
    assert_response :success
  end
end
