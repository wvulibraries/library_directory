class AlterPhonesTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :phones
    create_table :phones do |t|
      t.integer :number_types
      t.string :number
      t.references :phoneable
      t.timestamps
    end
  end
end
