class Subscriptor < ApplicationRecord
  validates :email, presence: true, uniqueness: true
end
