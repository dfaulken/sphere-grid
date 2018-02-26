class Ability < ApplicationRecord
  has_one :location, class_name: 'NodeLocation'
  has_one :default_character_ability
  has_one :default_character, through: :default_character_ability,
    class_name: 'Character', foreign_key: :character_id
  validates :ability_type, :sequence_number, presence: true
  validates :sequence_number, uniqueness: { scope: :ability_type }

  scope :of_type, -> (type) { where ability_type: type }

  def self.types
    order(:id).pluck(:type).uniq
  end
end
