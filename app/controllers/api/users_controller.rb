class Api::UsersController < Api::ApiController
  skip_before_filter :authenticate_user_from_token!, only: [:create]

  def create
    user = User.find_or_initialize_from_google_token(params[:google_token])

    if user
      status = (user.new_record?) ? 201 : 200

      if user.save
        render json: { user: user.as_json }, status: status
      else
        render json: { errors: 'Error saving user' }, status: :unprocessable_entity
      end
    else
      render json: { errors: 'No hay tu tia' }, status: :unprocessable_entity
    end
  end

  def index
    render json: { user: current_user.as_json }, status: :success
  end
end