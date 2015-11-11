class CommentsController < ApplicationController
  def create
    if user_signed_in?
      Comment.create(create_params)
      @comments = Comment.where(prototype_id: create_params[:prototype_id])
    end
  end

  def create_params
    params.require(:comment).permit(:text,:prototype_id).merge(user_id: current_user.id)
  end
end
