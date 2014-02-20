require 'test_helper'

class PhotoTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
  end

  test "should return user's name" do
    assert_equal @user.name, "#{@user.first_name} #{@user.last_name}"
  end
end
