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
    @user.name = "a" * 2
    assert_not @user.valid?
  end
  test "email should not be too short" do
    @user.email = "a@b.c"
    assert_not @user.valid?
  end
  test "should accept valid emails" do
    valid_emails = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                      first.last@foo.jp alice+bob@baz.cn a@b.co]
    valid_emails.each do |valid_email|
      @user.email = valid_email
      assert @user.valid?, "#{@user.email.inspect} should be valid"
    end
  end
  test "should not accept invalid emails" do
    invalid_emails = %w[user.example,com USER@fooCOM A_US-ER@foo_bar.org
                        first.last@foo+jp bob@alice+baz.cn a_b.c@o.]
    invalid_emails.each do |invalid_email|
      @user.email = invalid_email
      assert_not @user.valid?, "#{@user.email.inspect} should be invalid"
    end
  end
  test "should not accept duplicate user" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end
end
