class CreateActivations < ActiveRecord::Migration[5.1]
  def change
    create_table :activations do |t|
      t.integer :character_id
      t.integer :node_id
    end
  end
end
