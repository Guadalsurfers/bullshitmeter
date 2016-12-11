class Vote < ApplicationRecord
  belongs_to :article
  belongs_to :user

  validates :article, presence: true, uniqueness: { scope: :user }
  validates :user,    presence: true
  validates :rating,  presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1 }
end
