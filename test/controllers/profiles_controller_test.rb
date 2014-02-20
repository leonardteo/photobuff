require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "User should be able to view edit profile page" do
    session[:user_id] = users(:one).id
    get :edit
    assert_response :success
  end

  test "User should be able to update profile" do
    session[:user_id] = users(:one).id
    patch :update, :user => { :first_name => "Updated", :last_name => "Updated" }
    assert_response 302
    assert_redirected_to edit_profile_path
  end

  test "Not logged in user should be redirected" do
    get :edit
    assert_response 302
  end
end
