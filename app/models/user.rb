class User < ActiveRecord::Base
	has_secure_password
	validates_presence_of :username, :email
	validates 			  :username, :email, uniqueness: true
	validates             :username, length: { minimum: 3, maximum: 10 }
	validates_format      :email, :with => /\w+@\w+\.\w+/i

	has_many :friendships
	has_many :friends, through: :friendships
end
