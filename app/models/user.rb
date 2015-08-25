class User < ActiveRecord::Base
	has_secure_password
	validates :password,:length => { :minimum => 8 }
	validates_confirmation_of :password
	validates :email, presence: true, allow_nil: false, uniqueness: {scope: :email}

	def fullname
		first_name + ' ' + last_name
	end
end
