class BookshelvesController < ApplicationController
  # before_action :set_bookshelf, only: [:show, :edit, :update, :destroy]

  def show
    @user = User.find(params[:id])
    @shelf = Bookshelf.find(user_id: @user.id)

  end

  def search
    @books = Book.find_books(params[:query])
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
    # # Use callbacks to share common setup or constraints between actions.
    # def set_bookshelf
    #   @user = User.find(params[:id])
    #   @bookshelf = Bookshelf.find(user_id: params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bookshelf_params
      params.require(:bookshelf).permit(:user_id, :book)
    end
end
