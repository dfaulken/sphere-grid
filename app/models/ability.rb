class Ability < ActiveRecord::Base
  TYPES = ['Skill', 'Special', 'White Magic', 'Black Magic']

  has_one :node
  validates :node, :ability_type, :number, presence: true
  validates :ability_type, inclusion: { in: TYPES }
  validates :number, uniqueness: { scope: :ability_type }

  default_scope -> { order :number }
end
