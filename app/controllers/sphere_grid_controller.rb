class SphereGridController < ApplicationController
  def character_info
    character = Character.find_by name: params.require(:character)
    render partial: 'character_info', locals: { character: character }
  end

  def index
    @characters = Character.all
  end

  def node_data
    render json: Node.all, include: [:ability, :characters]
  end

  def toggle_node
    node = Node.find_by id: params.require(:id)
    character = Character.find_by name: params.require(:character)
    activated = character.toggle_activation node
    render json: { activated: activated }, status: :ok
  end

end
