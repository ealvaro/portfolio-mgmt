require 'test_helper'

class StockTest < ActiveSupport::TestCase

  test "should not save stock without symbol" do
    stock = Stock.new
    assert_not stock.save, "Saved the stock without a symbol"
  end
end
