class PhoneDefaultNumber < ActiveRecord::Migration[5.2]
  def change
    change_column_default :phones, :type, 0
  end
end
