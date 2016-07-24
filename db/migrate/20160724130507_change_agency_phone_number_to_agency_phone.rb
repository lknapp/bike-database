class ChangeAgencyPhoneNumberToAgencyPhone < ActiveRecord::Migration
  def change
    rename_column :agencies, :phone_number, :phone
    rename_column :agencies, :agency_name, :name
  end
end
