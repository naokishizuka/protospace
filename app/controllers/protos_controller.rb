class ProtosController < ApplicationController

  def new
    @proto = Proto.new
    @proto.images.build
  end

  def create
    proto = Proto.create(create_params)
    redirect_to controller: "top", action: "index"
  end

  private

  def create_params
    params.require(:proto).permit(:title,:catch_copy,:concept,images_attributes:[:image,:status]).merge(user_id: current_user.id)
  end

end
