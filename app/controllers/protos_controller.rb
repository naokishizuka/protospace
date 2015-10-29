class ProtosController < ApplicationController

  def new
    @proto = Proto.new
    @proto.images.build
  end

  def create
    Proto.create(proto_params)
    redirect_to :root
  end

  def show
    @proto = Proto.find(params[:id])
  end

  def destroy
    proto = Proto.find(params[:id])
    if proto.user.id == current_user.id
      proto.destroy
    end
    redirect_to :root
  end

  def edit
    @proto = Proto.find(params[:id])
  end

  def update
    proto = Proto.find(params[:id])
    if proto.user.id == current_user.id
      proto.update(proto_params)
    end
    redirect_to :root
  end

  private

  def proto_params
    params.require(:proto).permit(:title, :catch_copy, :concept, :user_id, images_attributes:[:id, :image, :status]).merge(user_id: current_user.id)
  end

end
