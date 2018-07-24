class AlterAddressIndex < ActiveRecord::Migration[5.2]
  def change
    remove_column :addresses, :addressable_id
    remove_column :addresses, :addressable_type
    add_reference :addresses, :addressable, polymorphic: true, index: true
  end
end
