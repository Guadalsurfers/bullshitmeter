class Api::VotesController < Api::ApiController
  def create
    vote = Articles::Rate.new(current_user, vote_params).call
    if vote.persisted?
      render json: { success: true}, status: 201
    else
      render json: { errors: vote.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:article_url, :rating)
  end
end