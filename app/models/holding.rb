class Holding < ActiveRecord::Base
  belongs_to :portfolio
  belongs_to :stock
  validates :stock, presence: true, allow_nil: false
  validates :portfolio, presence: true, allow_nil: false
end
