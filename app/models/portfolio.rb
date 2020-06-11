class Portfolio < ActiveRecord::Base
    validates :name, presence: true, allow_nil: false
    validates :ssn, presence: true, allow_nil: false
    has_many :holdings, :dependent => :destroy
    belongs_to :user
end
