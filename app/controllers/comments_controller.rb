class CommentsController < ApplicationController

  def create
      current_user.comments.create(create_params)
      @comments = Comment.where(prototype_id: create_params[:prototype_id])
  end

  def create_params
    params.require(:comment).permit(:text, :prototype_id)
  end
end
