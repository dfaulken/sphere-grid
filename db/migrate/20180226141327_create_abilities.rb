class CreateAbilities < ActiveRecord::Migration[5.1]
  def change
    create_table :abilities do |t|
      t.string :name
      t.string :ability_type
      t.integer :sequence_number
    end
  end
end
