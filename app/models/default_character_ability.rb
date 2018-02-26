class DefaultCharacterAbility < ApplicationRecord
  belongs_to :character
  belongs_to :ability

  def self.create_activations_for(user)
    all.each do |char_abl|
      char_abl.create_activation_for user
    end
  end

  def create_activation_for(user)
    Activation.create! node: ability.location.node_for(user),
                       character: character
  end
end
