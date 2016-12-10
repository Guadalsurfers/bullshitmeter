class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.citext :url,      index: { unique: true }, null: false
      t.float  :bs_index,                          null: false, default: 0.5

      t.timestamps
    end
  end
end
