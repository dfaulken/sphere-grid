class ChangeTypeToAbilityTypeInAbilities < ActiveRecord::Migration
  def change
    rename_column :abilities, :type, :ability_type
  end
end
