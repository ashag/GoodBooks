class User < ActiveRecord::Base
	has_secure_password
	validates_presence_of :name, :email
	validates 			  :name, :email, uniqueness: true
	validates             :name, length: { minimum: 3, maximum: 10 }
	validates_format_of   :email, :with => /\w+@\w+\.\w+/i

	has_many :friendships
	has_many :friends, through: :friendships
	has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id'
	has_many :inverse_friends, through: :inverse_friendships, source: :user

	has_one :bookshelf


end
