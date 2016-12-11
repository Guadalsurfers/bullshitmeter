class Api::ArticlesController < ApplicationController
  def show
    article = Article.find_by(url: params[:url])
    num_votes = article ? article.votes.count : 0

    render(
      json: {
        article: article,
        num_votes: num_votes,
        can_vote: !!current_user&.can_vote_article?(article)
      },
      status: :ok
    )
  end

  private

  def current_user
    User.first
  end

  def vote_params
    params.require(:vote).permit(:article_url, :rating)
  end
end
