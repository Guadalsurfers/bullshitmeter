class RemoveTimestampsFromJoinTables < ActiveRecord::Migration[5.0]
  def change
    remove_column :article_tags, :created_at
    remove_column :article_tags, :updated_at
    remove_column :article_authors, :created_at
    remove_column :article_authors, :updated_at
  end
end
