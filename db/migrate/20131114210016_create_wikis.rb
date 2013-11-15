class CreateWikis < ActiveRecord::Migration
  def change
    create_table :wikis do |t|
      t.string :subject
      t.string :description

      t.timestamps
    end
  end
end
