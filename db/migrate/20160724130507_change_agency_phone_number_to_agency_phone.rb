class ChangeAgencyPhoneNumberToAgencyPhone < ActiveRecord::Migration[5.0]
  def change
    rename_column :agencies, :phone_number, :phone
    rename_column :agencies, :agency_name, :name
  end
end
