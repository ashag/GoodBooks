class BookshelvesController < ApplicationController
  # before_action :set_bookshelf, only: [:show, :edit, :update, :destroy]

  def show
    @user = User.find(params[:id])
    @shelf = Bookshelf.find(user_id: @user.id)
  end

  def search
    @books = Book.find_books(params[:query])  
  end

  def add_book
    # refactor this crap later! 
    book = @books.find(isbn: params[:isbn]).first
    check_for_book = Book.check_book_in_shelf(book.isbn)
    if check_for_book == nil
      current_user.bookshelf.books.create(title: book.title, author: book.author, isbn: book.isbn, cover_image: book.cover_image)
      redirect_to user_path
    else
      redirect_to search_path, notice: 'Book is already in your bookshelf'
    end
  end

  def update
    respond_to do |format|
      if @bookshelf.update(bookshelf_params)
        format.html { redirect_to @bookshelf, notice: 'Bookshelf was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @bookshelf.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def bookshelf_params
      params.require(:bookshelf).permit(:user_id, :book)
    end
end
