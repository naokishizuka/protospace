class LikesController < ApplicationController
  def create
    current_user.likes.create(create_params)
    @prototype = Prototype.find(params[:prototype_id])
  end

  def destroy
    Like.find_by(id: params[:id]).destroy
    @prototype = Prototype.find(params[:prototype_id])
  end

  private

  def create_params
    params.permit(:prototype_id)
  end

end
