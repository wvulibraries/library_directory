class CreateSubjectables < ActiveRecord::Migration[5.2]
  def change
    create_table :subjectables do |t|
      t.belongs_to :employee, index: true
      t.belongs_to :subject, index: true
      t.timestamps
    end
  end
end
