class Ability < ActiveRecord::Base
  has_one :node
  validates :node, presence: true
end
