class ChangeStatus < ActiveRecord::Migration[5.2]
  def change
    change_column_default :buildings, :status, 0
  end
end
