class CharacterAttribute < ApplicationRecord
  belongs_to :character
  belongs_to :attribute
  validates :default_value, presence: true, inclusion: { in: -> { attribute.permitted_values } }
end
