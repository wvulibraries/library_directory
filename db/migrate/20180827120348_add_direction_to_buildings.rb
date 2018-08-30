class AddDirectionToBuildings < ActiveRecord::Migration[5.2]
  def change
    add_column :buildings, :directions, :text
  end
end
