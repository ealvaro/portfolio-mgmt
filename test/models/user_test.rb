require "test_helper"

class UserTest < ActiveSupport::TestCase

	test "fails because no password" do
		User.new({:email => "hans@hans.org"}).save
		assert_equal( User.count, 2 )
	end

	test "fails because passwrod to short" do
		User.new({:email => "hans@hans.org", :password => 'han'}).save
		assert_equal( User.count, 2 )
	end

	test "succeeds because password is long enough" do
		User.new({:email => "hans@hans.org", :password => 'hans@hans.orgohans@hans.orgo'}).save
		assert_equal( User.count, 3 )
	end

	test "fails because password confirmation doesnt match" do
		User.new({:email => "hans@hans.org", :password => 'hans@hans.orgohans@hans.orgo', :password_confirmation => 'aa'}).save
		assert_equal( User.count, 2 )
	end

	test "succeeds because password & confirmation match" do
		User.new({:email => "hans@hans.org", :password => 'secret123', :password_confirmation => 'secret123'}).save
		assert_equal( User.count, 3 )
	end

end
