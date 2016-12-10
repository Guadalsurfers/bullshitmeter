class CreateRatingEnum < ActiveRecord::Migration[5.0]
  def up
    values = Vote::RATING_TYPES.map { |v| "'#{v}'" }.join(',')
    execute "CREATE TYPE rating_enum AS ENUM (#{values})"
  end

  def down
    execute 'DROP TYPE rating_enum'
  end
end
