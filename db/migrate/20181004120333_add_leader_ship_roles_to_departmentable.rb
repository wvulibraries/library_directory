class AddLeaderShipRolesToDepartmentable < ActiveRecord::Migration[5.2]
  def change
    add_column :departmentables, :leadership_role, :int, :default => 0, :null => false
  end
end
