class Article < ApplicationRecord
  has_and_belongs_to_many :authors, join_table: :article_authors
  has_and_belongs_to_many :tags,    join_table: :article_tags

  has_many :votes,           dependent: :delete_all

  validates :bs_index, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1 }
  validates :url,      presence: true, uniqueness: true
end
