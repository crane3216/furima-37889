class RenamePhoneUnmberColumnToAddresses < ActiveRecord::Migration[6.0]
  def change
    rename_column :addresses, :phone_unmber, :phone_number
  end
end
