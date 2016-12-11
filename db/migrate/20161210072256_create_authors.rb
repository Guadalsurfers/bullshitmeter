class CreateAuthors < ActiveRecord::Migration[5.0]
  def change
    create_table :authors do |t|
      t.citext :name,           index: true, null: false
      t.citext :twitter_handle, index: true

      t.timestamps
    end
  end
end
