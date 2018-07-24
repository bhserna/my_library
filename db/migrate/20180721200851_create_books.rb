class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :name
      t.string :author_name
      t.string :isbn
      t.date :published_on
      t.integer :copies_count

      t.timestamps
    end
  end
end
