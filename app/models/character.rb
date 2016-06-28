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
      calculated_value = base_attributes[attribute] + nodes.where(attribute_name: attribute).sum(:value)
      max = case attribute
            when 'HP' then 99_999
            when 'MP' then 9_999
            else 255
            end
      [calculated_value, max].min
    end
  end

  def stats
    ATTRIBUTE_NAMES.map do |name|
      [name, send(name.parameterize.underscore)]
    end.to_h
  end

  # Returns whether the node is now activated by the character.
  def toggle_activation(node)
    if nodes.include? node
      nodes.delete node
      return false
    else
      nodes << node
      return true
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
