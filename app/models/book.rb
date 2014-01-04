class Book < ActiveRecord::Base
	has_many :bookshelves_books
	has_many :bookshelves, through: :bookshelves_books
end
