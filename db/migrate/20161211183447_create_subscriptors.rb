class CreateSubscriptors < ActiveRecord::Migration[5.0]
  def change
    create_table :subscriptors do |t|
      t.citext :email, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
