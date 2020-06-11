require 'test_helper'

class PortfolioTest < ActiveSupport::TestCase
  test 'fails because no name' do
    port = Portfolio.new; port.ssn = '123-45-6789'
    refute port.valid?, 'portfolio is valid without a name'
    assert_not_nil port.errors, 'no validation error for name present'
	end

  test 'fails because no ssn' do
    port = Portfolio.new; port.name = 'Joe Smo'
    refute port.valid?, 'portfolio is valid without a ssn'
    assert_not_nil port.errors, 'no validation error for name present'
  end
end
