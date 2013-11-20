class AddUsersToRoles < ActiveRecord::Migration
  def change
    add_column :roles, :user_id, :integer
    add_index :roles, :user_id
  end
end
