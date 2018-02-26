class Character < ApplicationRecord
  validates :name, :color, presence: true, uniqueness: true
  has_many :attributes, class_name: 'CharacterAttribute'
  has_many :activations
  has_many :default_character_abilities
  has_many :default_abilities, through: :default_character_abilities,
             class_name: 'Ability', foreign_key: :ability_id
end
