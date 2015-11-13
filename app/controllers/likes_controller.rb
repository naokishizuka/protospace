class LikesController < ApplicationController

  before_action :set_prototype, before: [:create, :destroy]

  def create
    current_user.likes.create(create_params)
  end

  def destroy
    like = Like.find(params[:id])
    like.destroy if like.user.id == current_user.id
  end

  private

  def create_params
    params.permit(:prototype_id)
  end

  def set_prototype
    @prototype = Prototype.find(params[:prototype_id])
  end

end
