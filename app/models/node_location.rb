class NodeLocation < ApplicationRecord
  serialize :connections, Array

  belongs_to :ability, optional: true
  belongs_to :default_attribute, class_name: 'Attribute', foreign_key: :default_attribute_id
  has_many :nodes

  validates :x, :y, presence: true
  validates :x, uniqueness: { scope: :y } # no two nodes with the same x AND y values
  validates :default_value, presence: { if: :default_attribute? },
            inclusion: { in: -> { default_attribute.permitted_values },
                         if: :default_attribute? }
  validates :lock_level, inclusion: { in: 1..4, allow_blank: true }

  scope :node_for, -> (user) { nodes.find_by user: user }
end
