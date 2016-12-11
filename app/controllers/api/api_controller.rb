class Api::ApiController < ApplicationController
  protect_from_forgery with: :null_session
  before_filter :authenticate_user_from_token!
  respond_to :json

  def authenticate_user_from_token!
    if !authenticate_user
      render json: { errors: "Mamona unautentificada" }, status: 401
    end
  end

  def authenticate_user
    user_id = auth_params[:id]
    user = user_id && User.find_by_id(user_id)
    token = auth_params[:authentication_token]

    if user && Devise.secure_compare(token, user.authentication_token)
      sign_in(:user, user, store: false)
      user
    else
      nil
    end
  end

  def auth_params
    params.require(:user).permit(:authentication_token, :id)
  end
end
