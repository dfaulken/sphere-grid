class ChangeAttributeToAttributeNameInNodes < ActiveRecord::Migration
  def change
    rename_column :nodes, :attribute, :attribute_name
  end
end
