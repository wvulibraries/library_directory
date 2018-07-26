class UniInfoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :university_classification, :string
  end
end
