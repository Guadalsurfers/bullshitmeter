class Vote < ApplicationRecord
  belongs_to :article
  belongs_to :user

  RATING_TYPES = %w(negative neutral positive).freeze

  enum rating: RATING_TYPES.each_with_object({}) { |v, h| h[v] = v }

  validates :article, presence: true, uniqueness: { scope: :user }
  validates :user,    presence: true
  validates :rating,  presence: true
end
