class AddUserIdToBook < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :User_id, :integer
  end
end
