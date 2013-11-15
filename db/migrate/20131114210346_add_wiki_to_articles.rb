class AddWikiToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :wiki_id, :belongs_to
  end
end
