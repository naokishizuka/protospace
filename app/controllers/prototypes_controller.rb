class PrototypesController < ApplicationController
  def new
    @prototype = Prototype.new
    @prototype.images.build
  end

  def create
    Prototype.create(prototype_params)
    redirect_to :root
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments
  end

  def destroy
    prototype = Prototype.find(params[:id])
    if prototype.user.id == current_user.id
      prototype.destroy
    end
    redirect_to :root
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    prototype = Prototype.find(params[:id])
    if prototype.user.id == current_user.id
      prototype.update(prototype_params)
    end
    redirect_to :root
  end


  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :user_id, images_attributes:[:id, :image, :status]).merge(user_id: current_user.id)
  end
end
