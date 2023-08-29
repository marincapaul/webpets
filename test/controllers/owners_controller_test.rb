require "test_helper"

class OwnersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = owners(:ion)
    @other_user = owners(:dan)
  end

end
