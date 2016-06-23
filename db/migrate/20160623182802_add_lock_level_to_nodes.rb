class AddLockLevelToNodes < ActiveRecord::Migration
  def change
    add_column :nodes, :lock_level, :integer
  end
end
