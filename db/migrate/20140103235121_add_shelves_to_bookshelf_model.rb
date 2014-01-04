class AddShelvesToBookshelfModel < ActiveRecord::Migration
  def change
  	add_column :bookshelves, :read, :boolean
  	add_column :bookshelves, :wants_to_read, :boolean
  	add_column :bookshelves, :currently_reading, :boolean
  end
end
