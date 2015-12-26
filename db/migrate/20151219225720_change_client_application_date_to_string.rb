class ChangeClientApplicationDateToString < ActiveRecord::Migration
  def up
    add_column :clients, :application_datetime, :datetime
    Client.all.to_a.each{ |client|
      if client.application_date
        client.update_attribute(:application_datetime, client.application_date)
      end
    }
    rename_column :clients, :application_date, :application_date_bkp
    rename_column :clients, :application_datetime, :application_date
  end

  def down
    remove_column :clients, :application_date
    rename_column :clients, :application_date_bkp, :application_date
  end
end
