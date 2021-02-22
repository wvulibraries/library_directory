class AddNameOfUrlToWebsites < ActiveRecord::Migration[5.2]
  def change
      add_column :websites, :name_of_url, :string
  end
end
