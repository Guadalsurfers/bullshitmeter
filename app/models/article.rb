class Article < ApplicationRecord
  has_many :article_authors, dependent: :delete_all
  has_many :authors,         through: :article_authors
  has_many :article_tags,    dependent: :delete_all
  has_many :tags,            through: :article_tags
  has_many :votes,           dependent: :delete_all

  validates :bs_index, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1 }
  validates :url,      presence: true, uniqueness: true
end
