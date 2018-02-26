class Node < ActiveRecord::Base
  belongs_to :node_location
  belongs_to :user
  belongs_to :attribute, optional: true
  validates :value, presence: { if: :attribute? },
            inclusion: { in: -> { attribute.permitted_values }, if: :attribute? }
end
