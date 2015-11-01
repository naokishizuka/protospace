class CommentsController < ApplicationController
  def create
    Comment.create(create_params)
    @comments = Comment.where(prototype_id: params[:comment][:prototype_id])
  end

  def create_params
    params.require(:comment).permit(:text,:prototype_id).merge(user_id: current_user.id)
  end
end
