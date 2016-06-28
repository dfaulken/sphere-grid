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
    character.toggle_activation node
    render nothing: true, status: :ok
  end

end
