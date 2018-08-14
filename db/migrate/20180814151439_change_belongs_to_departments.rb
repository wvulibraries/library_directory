class ChangeBelongsToDepartments < ActiveRecord::Migration[5.2]
  def change
    change_table :departments do |t|
      t.remove_references :departmentable, :polymorphic => true
      t.belongs_to :building
    end

    change_table :users do |t|
      t.belongs_to :department
    end
  end
end
