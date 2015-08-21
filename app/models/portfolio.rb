class Portfolio < ActiveRecord::Base

    has_many :holdings, :dependent => :destroy
    belongs_to :user
end
