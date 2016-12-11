class ChangeRatingToFloat < ActiveRecord::Migration[5.0]
  RATING_TYPES = %w(negative neutral positive).freeze

  def up
    remove_column :votes, :rating
    execute "DROP TYPE rating_enum"
    add_column :votes, :rating, :float, null: false
  end

  def down
    values = RATING_TYPES.map { |v| "'#{v}'" }.join(',')

    remove_column :votes, :rating
    execute "CREATE TYPE rating_enum AS ENUM (#{values})"
    add_column :votes, :rating, :rating_enum, null: false
  end
end
