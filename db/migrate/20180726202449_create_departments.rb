class CreateDepartments < ActiveRecord::Migration[5.2]
  def change
    create_table :departments do |t|
      t.string :name
      t.text :description
      t.references :departmentable, polymorphic: true
      t.timestamps
    end
  end
end
