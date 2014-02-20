require 'test_helper'

class AuthControllerTest < ActionController::TestCase
  test "should get login" do
    get :login
    assert_response :success
  end

  test "should login user" do
    @user = users(:one)
    post :dologin, :email => @user.email, :password => "password"
    assert_response 302
    assert_redirected_to root_path
  end
end
