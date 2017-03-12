class Medium < ApplicationRecord
  has_many :articles, dependent: :nullify

  validates :url, presence: true, uniqueness: true
end
