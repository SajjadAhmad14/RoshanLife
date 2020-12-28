class VotesController < ApplicationController

  def create
    @vote = Vote.create(user_id: params[:user_id], article_id: params[:article_id])
  end
end
