class AddUniqueness < ActiveRecord::Migration[5.2]
  def change
    add_index :buildings, :name, unique: true
    add_index :floors, :name, unique: true
  end
end
