class RenameUserIdColumnToBooks < ActiveRecord::Migration[5.2]
  def change
     rename_column :books, :User_id, :user_id
  end
end
