class CreateBookshelvesBooks < ActiveRecord::Migration
  def change
    create_table :bookshelves_books do |t|
      t.integer :bookshelf_id
      t.integer :book_id

      t.timestamps
    end
  end
end
