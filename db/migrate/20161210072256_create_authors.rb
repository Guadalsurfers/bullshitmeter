class CreateAuthors < ActiveRecord::Migration[5.0]
  def change
    create_table :authors do |t|
      t.string :name,           index: true, null: false
      t.string :twitter_handle, index: true

      t.timestamps
    end
  end
end
