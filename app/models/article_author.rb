class ArticleAuthor < ApplicationRecord
  belongs_to :article
  belongs_to :author

  validates :article, presence: true, uniqueness: { scope: :article }
  validates :author,  presence: true
end
