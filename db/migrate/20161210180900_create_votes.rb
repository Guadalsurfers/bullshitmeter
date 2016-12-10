class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.belongs_to :user,    index: true, null: false, foreign_key: { on_delete: :cascade }
      t.belongs_to :article, index: true, null: false, foreign_key: { on_delete: :cascade }
      t.column     :rating, :rating_enum, null: false

      t.timestamps
    end

    add_index :votes, [:user_id, :article_id], unique: true
  end
end
