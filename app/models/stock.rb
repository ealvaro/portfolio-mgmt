class Stock < ActiveRecord::Base
  has_many :stocks, :through => :holdings
  has_many :holdings
end
