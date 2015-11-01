class LikesController < ApplicationController
  def create
    current_user.likes.create(create_params)
    @prototype = Prototype.find(params[:prototype_id])
  end

  def destroy
    like = Like.find(params[:id])
    if like.user.id == current_user.id
      like.destroy
      @prototype = Prototype.find(params[:prototype_id])
    end
  end

  private

  def create_params
    params.permit(:prototype_id)
  end

end
