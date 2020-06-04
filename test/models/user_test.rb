require "test_helper"

class UserTest < ActiveSupport::TestCase

  test 'fails because no email' do
    user = User.new
    refute user.valid?, 'user is valid without an email'
    assert_not_nil user.errors[:email], 'no validation error for email present'
	end

	test "fails because no password" do
		before = User.count
		User.new({:email => "hans1@hans.org"}).save
		assert_equal( before, User.count )
	end

	test "fails because password too short" do
		before = User.count
		User.new({:email => "hans2@hans.org", :password => 'han'}).save
		assert_equal( before, User.count )
	end

	test "succeeds because password is long enough" do
		u = User.new({:email => "hans3@hans.org", :password => 'secret123'})
    assert_difference 'User.count' do
      assert u.save
    end
	end

	test "fails because password confirmation doesnt match" do
		before = User.count
		User.new({:email => "hans4@hans.org", :password => 'hans@hans.orgohans@hans.orgo', :password_confirmation => 'aa'}).save
		assert_equal( before, User.count)
	end

	test "succeeds because password & confirmation match" do
		u = User.new({:email => "hans5@hans.org", :password => 'secret123', :password_confirmation => 'secret123'})
    assert_difference 'User.count' do
      assert u.save
    end
	end

end
