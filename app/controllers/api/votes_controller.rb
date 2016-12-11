class Api::VotesController < ApplicationController
  def create
    vote = Articles::Rate.new(current_user, vote_params).call
    if vote.persisted?
      head :created
    else
      render json: { errors: vote.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private
  # TODO
  def current_user
    User.first
  end

  def vote_params
    params.require(:vote).permit(:article_url, :rating)
  end
end
