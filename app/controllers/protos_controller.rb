class ProtosController < ApplicationController

  def new
    @proto = Proto.new
  end

  def create
    Proto.create(create_params)
    redirect_to controller: "top", action: "index"
  end

  private

  def create_params
    params.permit(:title,:catch_copy,:concept).merge(user_id: current_user.id)
  end

end
