class LikesController < ApplicationController
  def create
    Like.create(user_id: current_user.id, prototype_id: params[:prototype_id])
    redirect_to :root
  end

  def destroy
    Like.find_by(user_id: current_user.id, prototype_id: params[:prototype_id]).destroy
    redirect_to :root
  end
end
