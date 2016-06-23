class Character < ActiveRecord::Base
  ATTRIBUTE_NAMES = %w(HP MP
                  Strength Defense Magic Magic\ Defense
                  Agility Luck Evasion Accuracy)

  validates :name, :color, presence: true, uniqueness: true
  serialize :base_attributes, Hash
  validate :base_attributes_correct?
  has_and_belongs_to_many :nodes
  has_many :abilities, through: :nodes

  ATTRIBUTE_NAMES.each do |attribute|
    define_method attribute.parameterize.underscore do
      base_attributes[attribute] + nodes.where(attribute_name: attribute).sum(:value)
    end
  end

  private

  def base_attributes_correct?
    unless base_attributes.keys == ATTRIBUTE_NAMES
      errors.add :base_attributes, 'has incorrect keys'
    end
    unless base_attributes.values.all?{|v| v.is_a? Fixnum }
      errors.add :base_attributes, 'must have Integer values'
    end
  end
end
