class Portfolio < ActiveRecord::Base

    has_many :holdings, :dependent => :destroy

end
