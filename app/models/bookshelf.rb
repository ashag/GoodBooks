class Bookshelf < ActiveRecord::Base
	has_many :bookshelves_books
	has_many :books, through: :bookshelves_books
	belongs_to :user
end
