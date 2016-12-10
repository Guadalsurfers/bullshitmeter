class Tag < ApplicationRecord
  has_many :article_tags, dependent: :delete_all
  has_many :articles,     through: :article_tags

  validates :name,  presence: true, uniqueness: true
end
