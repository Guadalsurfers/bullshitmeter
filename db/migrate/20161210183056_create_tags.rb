class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.citext :name,  null: false, index: { unique: true }

      t.timestamps
    end
  end
end
