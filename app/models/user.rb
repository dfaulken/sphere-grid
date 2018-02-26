class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :nodes

  after_create :initialize_default_grid

  def initialize_default_grid
    NodeLocation.all.each do |loc|
      Node.create! user: self, node_location: loc,
        attribute: loc.attribute, value: loc.value,
        locked: loc.lock_level?
      DefaultCharacterAbility.create_activations_for(self)
    end
  end
end
