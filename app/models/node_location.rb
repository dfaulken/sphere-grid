class NodeLocation < ApplicationRecord
  serialize :connections, Array

  belongs_to :ability, optional: true
  belongs_to :default_attribute, class_name: 'Attribute'
  has_many :nodes

  validates :x, :y, presence: true
  validates :x, uniqueness: { scope: :y } # no two nodes with the same x AND y values
  validates :default_value, presence: { if: ->(loc) { loc.default_attribute.present? } },
    inclusion: { in: ->(loc) { loc.default_attribute.permitted_values },
                 if: ->(loc) { loc.default_attribute.present? } }
  validates :lock_level, inclusion: { in: 1..4, allow_blank: true }

  def node_for(user)
    nodes.find_by user: user
  end
end
