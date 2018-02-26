class CreateDefaultCharacterAbilities < ActiveRecord::Migration[5.1]
  def change
    create_table :default_character_abilities do |t|
      t.integer :character_id
      t.integer :ability_id
    end
  end
end
