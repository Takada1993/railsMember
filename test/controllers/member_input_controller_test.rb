require 'test_helper'

class MemberInputControllerTest < ActionDispatch::IntegrationTest
  test "should get memberView" do
    get member_input_memberView_url
    assert_response :success
  end

end
