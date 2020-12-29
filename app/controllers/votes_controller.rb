class VotesController < ApplicationController
  def create
    @vote = Vote.find_or_create_by(user_id: params[:user_id], article_id: params[:article_id])
    redirect_to request.referrer, notice: "Voted"
  end
end
