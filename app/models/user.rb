class User < ApplicationRecord
	attr_accessor :remember_token
	before_create :remember
	has_many :posts

	has_secure_password

	def User.digest(string)
    Digest::SHA1.hexdigest(string)
  end

	def User.new_token
  	SecureRandom.urlsafe_base64
  end

	def remember
		self.remember_token = User.new_token
  	self.remember_digest = User.digest(remember_token)
	end
end
