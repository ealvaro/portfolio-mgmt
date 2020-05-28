class Stock < ActiveRecord::Base
  validates :symbol, presence: true
  has_many :portfolios, :through => :holdings
  has_many :holdings

end
