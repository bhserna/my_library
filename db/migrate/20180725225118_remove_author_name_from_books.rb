class RemoveAuthorNameFromBooks < ActiveRecord::Migration[5.1]
  def change
    remove_column :books, :author_name, :string
  end
end
