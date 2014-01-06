class Book < ActiveRecord::Base
	has_many :bookshelves_books
	has_many :bookshelves, through: :bookshelves_books

	def self.find_books(search)
		@google_api ||= HTTParty.get("https://www.googleapis.com/books/v1/volumes?q=#{search}&startIndex=0&maxResults=40&key=AIzaSyAmSBRYHNDvweNFYEN44Ju5-TiJNGqX-iw")
		@google_api.parsed_response['items'].map do |volume|
			book = Book.new()
			book.isbn = volume['volumeInfo']['industryIdentifiers'].first['identifier']
			book.title = volume['volumeInfo']['title']
			book.author = volume['volumeInfo']['authors'].first
			book.cover_image = volume['volumeInfo']['imageLinks']['thumbnail']
			book
		end
	end

	def self.check_book_in_shelf
		current_user.bookshelf.books.where(isbn: params[:isbn])
	end

	def self.add_book_to_shelf
		current_user.bookshelf.books.create(title: )
	end
end
