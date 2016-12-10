class CreateArticleAuthors < ActiveRecord::Migration[5.0]
  def change
    create_table :article_authors do |t|
      t.belongs_to :article, null: false, index: true, foreign_key: { on_delete: :cascade}
      t.belongs_to :author,  null: false, index: true, foreign_key: { on_delete: :cascade}

      t.timestamps
    end

    add_index :article_authors, [:article_id, :author_id], unique: true
  end
end
