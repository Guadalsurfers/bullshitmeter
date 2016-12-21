class AddMoreMetadataToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :language, :citext, index: true
    add_column :articles, :featured_image, :string
    add_column :articles, :published_at, :datetime, index: true
    add_column :articles, :excerpt, :text
  end
end
