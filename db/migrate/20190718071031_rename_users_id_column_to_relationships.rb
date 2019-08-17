class RenameUsersIdColumnToRelationships < ActiveRecord::Migration[5.2]
  def change
    rename_column :relationships, :users_id, :user_id
  end
end
