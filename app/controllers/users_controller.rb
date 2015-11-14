class UsersController < ApplicationController
  def edit
  end

  def show
    @prototypes = current_user.prototypes.page(params[:page]).per(8)
  end

  def update
    current_user.update(update_params)
    redirect_to :root
  end

  private

  def update_params
    params.require(:user).permit(:member, :profile, :avatar, :works, :user_name)
  end
end
