require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:terrence)
  end

  test "login with invalid info" do
    get login_path
    assert_template 'sessions/new'
    post login_path, session: { email: "", password:"" }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?

  end

  test "login with valid info followed by log out" do
    get login_path
    post login_path, session: { email: @user.email,  password:'password' }
    assert logged_in?
    assert_redirected_to @user  
    follow_redirect!
    assert_template 'users/show'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path, count: 1
    delete logout_path
    assert_redirected_to root_url
    assert_select "a[href=?]", users_new_path, count: 1
    assert_select "a[href=?]", logout_path, count: 0
  end
end
