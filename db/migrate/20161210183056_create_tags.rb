class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.string :name,  null: false, index: true
      t.string :value, null: false, index: true

      t.timestamps
    end

    add_index :tags, [:name, :value], unique: true
  end
end
