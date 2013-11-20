class AddWikiToRoles < ActiveRecord::Migration
  def change
    add_column :roles, :wiki_id, :integer
    add_index :roles, :wiki_id
  end
end
