class Ability < ApplicationRecord
  TYPES = ['Skill', 'Special', 'White Magic', 'Black Magic']

  has_one :location, class_name: 'NodeLocation'
  has_one :default_character_ability, optional: true
  has_one :default_character, through: :default_character_ability,
    class_name: 'Character', foreign_key: :character_id, optional: true
  validates :ability_type, :number, presence: true
  validates :ability_type, inclusion: { in: TYPES }
  validates :number, uniqueness: { scope: :ability_type }

  default_scope -> { order :number }

  scope :of_type, -> (type) { where ability_type: type }
end
