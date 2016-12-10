class Author < ApplicationRecord
  has_many :article_authors, dependent: :delete_all
  has_many :articles,        through: :article_authors

  validates :name, presence: true
end
