class HasManyDepartments < ActiveRecord::Migration[5.2]
  def change
    create_table :departmentables do |t|
      t.belongs_to :employee, index: true
      t.belongs_to :department, index: true
      t.timestamps
    end
  end
end
