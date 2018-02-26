class Attribute < ApplicationRecord
  serialize :permitted_values, Array

  validates :name, :abbreviation, :sequence_number,
    presence: true, uniqueness: true
  validates :color, presence: true

  has_many :character_attributes
  has_many :node_locations
  has_many :nodes
end
