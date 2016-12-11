class User < ApplicationRecord
  has_many :votes, dependent: :delete_all

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save :ensure_authentication_token

  def self.find_or_initialize_from_google_token(access_token)
    begin
      if valid_google_token access_token
        google_response = HTTParty.get(google_get_profile_endpoint access_token).parsed_response
        google_id = google_response['id']
        user = User.find_or_initialize_by(google_id: google_id)
        user.first_name = google_response['name']['givenName']
        user.last_name = google_response['name']['familyName']
        user.email = "#{google_id}@gmail.com" # ~Clean Code~
        user.password = 'es justo y necesario' # ~More Clean Code~

        return user
      end
    rescue
      # Gotta catch 'em all
    end
    nil
  end

  def as_json(options={})
    options[:only] ||= [:email, :first_name, :last_name, :id,
                        :authentication_token]
    super
  end

  def can_vote_article?(article)
    article.nil? || votes.find_by(article: article).nil?
  end

  def vote_for_article(article)
    votes.find_by(article: article)
  end

  def self.google_get_profile_endpoint(token)
    "https://www.googleapis.com/plus/v1/people/me?access_token=#{token}"
  end

  def self.valid_google_token(token)
    validation_url = "https://www.googleapis.com/oauth2/v3/tokeninfo?access_token=#{token}"
    parsed_response = HTTParty.get(validation_url).parsed_response
    (parsed_response['aud']== GOOGLE_CLIENT_ID)
  end

  private

  def ensure_authentication_token
    if authentication_token.blank?
      loop do
        token = Devise.friendly_token

        if !User.find_by_authentication_token(token)
          self.authentication_token = token
          break
        end
      end
    end
  end
end
