class AddStatusToDepartments < ActiveRecord::Migration[5.2]
  def change
    add_column :departments, :status, :integer
  end
end
