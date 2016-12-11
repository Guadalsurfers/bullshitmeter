class User < ApplicationRecord
  has_many :votes, dependent: :delete_all

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def can_vote_article?(article)
    article.nil? || votes.find_by(article: article).nil?
  end
end
