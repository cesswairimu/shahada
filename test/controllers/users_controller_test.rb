require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get users_new_url
    assert_response :success
  end
  test "should get show" do
    get user_url
    assert_template 'show'
  end
  test "should get index" do
  get index_path
  assert_template 'index'
end
  

end
