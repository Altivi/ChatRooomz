require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = User.new(name: "I am User", email: "user@gmail.com", password: "lololo", password_confirmation: "lololo")
  end

  test " user valid" do
    assert @user.valid?
  end

  test "name exist" do
  	@user.name = "     "
  	assert_not @user.valid?
  end

  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = "       "
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "asdas"
    assert_not @user.valid?
  end

end
