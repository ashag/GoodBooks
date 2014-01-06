class AddIsbnAndCoverImageToBooks < ActiveRecord::Migration
  def change
  	add_column :books, :isbn, :string
  	add_column :books, :cover_image, :string
  end
end
