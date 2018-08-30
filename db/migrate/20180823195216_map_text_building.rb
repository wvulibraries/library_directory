class MapTextBuilding < ActiveRecord::Migration[5.2]
  def change
    change_column :buildings, :map_link, :text
  end
end
