class PrototypesController < ApplicationController

  def index
    @prototypes = Prototype.order(likes_count: :DESC).page(params[:page]).per(8)
  end

  def new
    if user_signed_in?
      @prototype = Prototype.new
      @prototype.images.build
    else
      redirect_to :root
    end
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
    prototype.destroy if prototype.user.id == current_user.id
    redirect_to :root
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    prototype = Prototype.find(params[:id])
    prototype.update(prototype_params) if prototype.user.id == current_user.id
    redirect_to :root
  end

  def newest
    @prototypes = Prototype.order(created_at: :DESC).page(params[:page]).per(8)
    render action: :index
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :user_id, images_attributes:[:id, :image, :status]).merge(user_id: current_user.id, tag_list: params[:tags])
  end

end
