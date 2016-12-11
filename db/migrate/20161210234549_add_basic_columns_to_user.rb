class AddBasicColumnsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column  :users, :first_name,  :string, null: false
    add_column  :users, :last_name,   :string, null: false
    add_column  :users, :google_id,   :string, null: false
    add_column  :users, :authentication_token, :string, null: false

    add_index :users, :google_id,            unique: true
    add_index :users, :authentication_token, unique: true
  end
end
