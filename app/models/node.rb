class Node < ActiveRecord::Base
  belongs_to :node_location
  belongs_to :user
  belongs_to :attr, class_name: 'Attribute',
    foreign_key: :attribute_id, optional: true
  validates :value, presence: { if: ->(node) { node.attr.present? } },
    inclusion: { in: ->(node) { node.attr.permitted_values },
                 if: ->(node) { node.attr.present? }  }
end
