class SingleTableInhUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :type, :string
  end
end
