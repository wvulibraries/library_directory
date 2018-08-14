class CreateServicePoints < ActiveRecord::Migration[5.2]
  def change
    create_table :service_points do |t|
      t.string :name
      t.belongs_to :department
      t.timestamps
    end
  end
end
