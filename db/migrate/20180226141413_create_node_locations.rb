class CreateNodeLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :node_locations do |t|
      t.integer :x
      t.integer :y
      t.integer :ability_id
      t.text :connections
      t.integer :lock_level
      t.integer :default_attribute_id
      t.integer :default_value
    end
  end
end
