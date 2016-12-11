class Author < ApplicationRecord
  has_and_belongs_to_many :articles,  join_table: :article_authors

  validates :name, presence: true
end
