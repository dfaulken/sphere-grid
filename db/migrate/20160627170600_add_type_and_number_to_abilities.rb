class AddTypeAndNumberToAbilities < ActiveRecord::Migration
  def change
    add_column :abilities, :type, :string
    add_column :abilities, :number, :integer
  end
end
