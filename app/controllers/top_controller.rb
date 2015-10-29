class TopController < ApplicationController
  def index
    @protos = Proto.all
  end
end
