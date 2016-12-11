class Api::ArticlesController < Api::ApiController
  skip_before_filter :authenticate_user_from_token!, only: [:show]

  def show
    article = Article.find_by(url: params[:url])
    num_votes = article ? article.votes.count : 0
    user = authenticate_user

    render(
      json: {
        article: article,
        num_votes: num_votes,
        can_vote: !!user&.can_vote_article?(article)
      },
      status: :ok
    )
  end
end
