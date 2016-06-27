class SphereGridController < ApplicationController
  def index
    @characters = Character.all
  end

  def node_data
    render json: Node.all, include: [:ability, :characters]
  end
end
