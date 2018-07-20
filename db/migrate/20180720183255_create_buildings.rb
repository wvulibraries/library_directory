class CreateBuildings < ActiveRecord::Migration[5.2]
  def change
    create_table :buildings do |t|
      t.string :name
      t.string :map_link
      t.integer :status

      t.timestamps
    end
  end
end
