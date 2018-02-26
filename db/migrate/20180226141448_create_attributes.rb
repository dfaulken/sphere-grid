class CreateAttributes < ActiveRecord::Migration[5.1]
  def change
    create_table :attributes do |t|
      t.string :name
      t.string :abbreviation
      t.string :color
      t.integer :sequence_number
      t.text :permitted_values
    end
  end
end
