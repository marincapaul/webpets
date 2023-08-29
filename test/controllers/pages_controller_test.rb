require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest

  test "should get home" do
    get root_path
    assert_redirected_to new_owner_session_url
  end
end
