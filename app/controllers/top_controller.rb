class TopController < ApplicationController
  def index
    @prototypes = Prototype.all
  end
end
