require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "the user gets created without username" do
    user = User.new
    user.password_digest = "iauhdasd1A$a"
    user.phone_number = "9887654321"
    puts user.password_digest
    puts user.phone_number
    assert_not user.save, "Saved the user without username"
  end
  test "the user gets created without phonenumber" do
    user = User.new
    user.password_digest = "iauhdasd1A$a"
    user.username = "KevinSpacey"
    assert_not user.save, "Saved the user without phonenumber"
  end
  test "the user gets created without a 10 digit phonenumber" do
    user = User.new
    user.password_digest = "iauhdasd1A$a"
    user.username = "KevinSpacey"
    user.phone_number = "90012321"
    assert_not user.save, "Saved the user without phonenumber"
  end
  test "the user gets created without a proper password" do
    user = User.new
    user.password_digest = "iau"
    user.username = "KevinSpacey"
    user.phone_number = "90012321"
    assert_not user.save, "Saved the user without proper password"
  end
  test "the user gets created without a password" do
    user = User.new
    user.username = "KevinSpacey"
    user.phone_number = "90012321"
    assert_not user.save, "Saved the user without a password"
  end
end
