class Book < ActiveRecord::Base
	has_many :bookshelves_books
	has_many :bookshelves, through: :bookshelves_books

	def self.find_books(search)
		@lookup_books = HTTParty.get("https://www.googleapis.com/books/v1/volumes?q=#{search}&startIndex=0&maxResults=10&key=AIzaSyAmSBRYHNDvweNFYEN44Ju5-TiJNGqX-iw")
		self.assign_values
	end

	def self.assign_values
		@lookup_books.parsed_response['items']
	end
end
