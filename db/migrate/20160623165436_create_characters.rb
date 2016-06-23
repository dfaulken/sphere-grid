class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.string :color
      t.string :base_attributes

      t.timestamps null: false
    end
  end
end
