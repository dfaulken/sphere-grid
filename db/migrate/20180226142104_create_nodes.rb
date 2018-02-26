class CreateNodes < ActiveRecord::Migration[5.1]
  def change
    create_table :nodes do |t|
      t.integer :node_location_id
      t.integer :user_id
      t.integer :attribute_id
      t.integer :value
      t.boolean :locked
    end
  end
end
