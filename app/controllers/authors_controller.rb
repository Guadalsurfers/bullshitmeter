class AuthorsController < ApplicationController
  def index
    # Add pagination and allow to order by avg score (create materialized view for that)
    @authors = Author.order(:name)
  end

  def show
    @author = Author.find(params[:author_id])
    @articles = @author.articles
  end
end
