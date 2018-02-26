class Attribute < ApplicationRecord
  serialize :permitted_values, Array

  validates :name, :abbreviation, :color, :sequence_number,
    presence: true, uniqueness: true

  has_many :character_attributes
  has_many :node_locations
  has_many :nodes
end
