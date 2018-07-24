class CreateFloors < ActiveRecord::Migration[5.2]
  def change
    create_table :floors do |t|
      t.string :name
      t.string :image
      t.timestamps
    end
    add_reference :floors, :building
  end
end
