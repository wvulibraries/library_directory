class PhonesPolymorphic < ActiveRecord::Migration[5.2]
  def change
    drop_table :phones
    create_table :phones do |t|
      t.integer :number_types
      t.string :number
      t.timestamps
    end
    add_reference :phones, :phoneable, polymorphic: true
  end
end