class Stock < ActiveRecord::Base

  has_many :portfolios, :through => :holdings
  has_many :holdings

end
