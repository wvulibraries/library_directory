class PreferredNameUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :preferred_name, :string
  end
end
