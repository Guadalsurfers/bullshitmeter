class CreateArticleTags < ActiveRecord::Migration[5.0]
  def change
    create_table :article_tags do |t|
      t.belongs_to :article, null: false, index: true, foreign_key: { on_delete: :cascade }
      t.belongs_to :tag,     null: false, index: true, foreign_key: { on_delete: :cascade }

      t.timestamps
    end

    add_index :article_tags, [:article_id, :tag_id], unique: true
  end
end
