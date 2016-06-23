class CreateNodeActivations < ActiveRecord::Migration
  def change
    create_join_table :characters, :nodes
  end
end
