class CreateMedia < ActiveRecord::Migration[5.0]
  def change
    create_table :media do |t|
      t.string :url,  null: false, index: { unique: true }
      t.string :name, index: true
      t.string :logo

      t.timestamps
    end

    add_column :articles, :medium_id, :integer
    add_index  :articles, :medium_id
    add_foreign_key :articles, :media, column: :medium_id, on_delete: :nullify
  end
end
