class LikesController < ApplicationController

  def create
    @prototype = Prototype.find(params[:prototype_id])
    current_user.likes.create(create_params)
  end

  def destroy
    @prototype = Prototype.find(params[:prototype_id])
    like = Like.find(params[:id])
    like.destroy if like.user.id == current_user.id
  end

  private

  def create_params
    @prototype = Prototype.find(params[:prototype_id])
    params.permit(:prototype_id)
  end

end
