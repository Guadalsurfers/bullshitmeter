class Author < ApplicationRecord
  has_and_belongs_to_many :articles,  join_table: :article_authors

  validates :name, presence: true

  # TODO placeholder methods, this should come from a materialized view
  # where we would store a summary of each author
  def score
    rand(0..100)
  end

  def total_articles
    rand(0...1000)
  end
end
