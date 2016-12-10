class Article < ApplicationRecord
  validates :bs_index, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1 }
  validates :url,      presence: true, uniqueness: true
end
