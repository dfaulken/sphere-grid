class Node < ActiveRecord::Base
  validates :x, :y, presence: true
  validates :x, uniqueness: { scope: :y } # no two nodes with the same x AND y values
  serialize :connections, Array
  validates :attribute_name, inclusion: { in: Character::ATTRIBUTE_NAMES }, allow_blank: true
  validates :value, presence: true, if: -> { attribute_name.present? }
  validates :lock_level, inclusion: { in: 1..4 }, allow_blank: true
  belongs_to :ability
  has_and_belongs_to_many :characters
end
