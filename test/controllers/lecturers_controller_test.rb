require 'test_helper'

class LecturersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get lecturers_new_url
    assert_response :success
  end

end
