class Delete2 < ActiveRecord::Migration[5.2]
  def change
    drop_table :relationships
  end
end
