class CreatePhones < ActiveRecord::Migration[5.2]
  def change
    create_table :phones do |t|
      t.integer :type
      t.string :number
      t.references :phoneable

      t.timestamps
    end
  end
end
