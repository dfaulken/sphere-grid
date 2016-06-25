class Node < ActiveRecord::Base
  validates :x, :y, presence: true
  validates :x, uniqueness: { scope: :y } # no two nodes with the same x AND y values
  serialize :connections, Array
  validates :attribute_name, inclusion: { in: Character::ATTRIBUTE_NAMES }, allow_blank: true
  validates :value, presence: true, if: -> { attribute_name.present? }
  validate :value_valid_for_attribute_name?, if: -> { attribute_name.present? }
  validates :lock_level, inclusion: { in: 1..4 }, allow_blank: true
  belongs_to :ability
  has_and_belongs_to_many :characters

  private

  def value_valid_for_attribute_name?
    permitted_values = case attribute_name
                       when 'HP' then [200, 300]
                       when 'MP' then [10, 20, 30, 40]
                       else [1, 2, 3, 4]
                       end
    unless permitted_values.include? value
      errors.add :base, <<-ERROR
        Unpermitted value #{value} for node of type #{attribute_name}.
        Permitted values are: #{permitted_values.join ', '}.
      ERROR
    end
  end
end
