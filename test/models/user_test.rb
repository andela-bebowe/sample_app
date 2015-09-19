require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Example User", email: "user@example.com")
  end

  test "name should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = "     "
    assert_not @user.valid?
  end
  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end
  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end
  test "email should not be too long" do
    @user.email = "a" * 101 + "@gmail.co"
    assert_not @user.valid?
  end
  test "name should not be too short" do
    @user.name = "a" * 4
    assert_not @user.valid?
  end
  test "email should not be too short" do
    @user.email = "gmailco"
    assert_not @user.valid?
  end
end
