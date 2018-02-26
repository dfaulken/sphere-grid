class CharacterAttribute < ApplicationRecord
  belongs_to :character
  belongs_to :attr, class_name: 'Attribute', foreign_key: :attribute_id
end
