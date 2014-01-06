class Bookshelf < ActiveRecord::Base
	has_many :bookshelf_books 
	has_many :books, through: :bookshelf_books
	belongs_to :user
end
