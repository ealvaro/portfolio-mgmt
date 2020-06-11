require 'test_helper'

class HoldingTest < ActiveSupport::TestCase

  test 'fails because no portfolio' do
    h = Holding.new; h.stock = stocks(:one_stock)
    refute h.valid?, 'holding is valid without a portfolio'
    assert_not_nil h.errors, 'no validation error for portfolio present'
	end

  test 'fails because no stock' do
    h = Holding.new; h.portfolio = portfolios(:one_port)
    refute h.valid?, 'holding is valid without a portfolio'
    assert_not_nil h.errors, 'no validation error for portfolio present'
	end
end
