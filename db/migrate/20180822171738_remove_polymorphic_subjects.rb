class RemovePolymorphicSubjects < ActiveRecord::Migration[5.2]
  def change
    change_table :subjects do |t|
      t.remove_references :subjectable, :polymorphic => true
    end
  end
end
