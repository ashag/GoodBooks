class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :rating
      t.date :start_date
      t.date :completed_date
      t.text :review

      t.timestamps
    end
  end
end
