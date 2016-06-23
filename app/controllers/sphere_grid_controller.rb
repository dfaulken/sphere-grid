class SphereGridController < ApplicationController
  def index
  end

  def node_data
    render json: Node.all
  end
end
