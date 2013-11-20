class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles, :id => false do |t|
      t.string :role 

      t.timestamps
    end
  end
end
