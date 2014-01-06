class RemoveShelvesFromBookshelfAndAddToJoinTable < ActiveRecord::Migration
  def up
  	remove_column :bookshelves, :read 
  	remove_column :bookshelves, :wants_to_read
  	remove_column :bookshelves, :currently_reading

  	add_column :bookshelf_books, :read, :boolean
  	add_column :bookshelf_books, :wants_to_read, :boolean
  	add_column :bookshelf_books, :currently_reading, :boolean 
  end

  def down
  	add_column :bookshelves, :read, :boolean
  	add_column :bookshelves, :wants_to_read, :boolean
  	add_column :bookshelves, :currently_reading, :boolean

  	remove_column :bookshelf_books, :read 
  	remove_column :bookshelf_books, :wants_to_read
  	remove_column :bookshelf_books, :currently_reading
  end
end
