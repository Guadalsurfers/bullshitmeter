class Api::VotesController < Api::ApiController
  def create
    vote = Articles::Rate.new(current_user, vote_params).call
    if vote.persisted?
      head :created
    else
      render json: { errors: vote.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:article_url, :rating)
  end
end
