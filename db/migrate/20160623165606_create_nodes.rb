class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.integer :x
      t.integer :y
      t.string :connections
      t.string :attribute
      t.integer :value
      t.integer :ability_id

      t.timestamps null: false
    end
  end
end
