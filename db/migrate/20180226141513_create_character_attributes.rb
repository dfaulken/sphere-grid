class CreateCharacterAttributes < ActiveRecord::Migration[5.1]
  def change
    create_table :character_attributes do |t|
      t.integer :character_id
      t.integer :attribute_id
      t.integer :default_value
    end
  end
end
