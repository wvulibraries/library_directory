class AddEmployeeInfoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :job_title, :string
    add_column :users, :description, :text
    add_column :users, :image, :string
    add_column :users, :office_number, :string
  end
end
