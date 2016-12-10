class CreateAuthors < ActiveRecord::Migration[5.0]
  def change
    create_table :authors do |t|
      t.string :name, null: false, index: true
      t.string :twitter_handle

      t.timestamps
    end
  end
end
