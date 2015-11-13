class PrototypesController < ApplicationController

  before_action :set_instance_variable_prototype, only: [:show, :edit]
  before_action :set_prototype, only: [:destroy, :update]

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
    @comment = Comment.new
    @comments = @prototype.comments
  end

  def destroy
    prototype.destroy if prototype.user.id == current_user.id
    redirect_to :root
  end

  def edit
  end

  def update
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

  def set_instance_variable_prototype
    @prototype = Prototype.find(params[:id])
  end

  def set_prototype
    prototype = Prototype.find(params[:id])
  end
end
