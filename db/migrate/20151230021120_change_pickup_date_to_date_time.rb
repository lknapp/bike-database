class ChangePickupDateToDateTime < ActiveRecord::Migration[5.0]
  def up
    add_column :clients, :pickup_datetime, :datetime
    Client.all.to_a.each{ |client|
      if client.pickup_date
        client.update_attribute(:pickup_datetime, client.pickup_date)
      end
    }
    rename_column :clients, :pickup_date, :pickup_date_bkp
    rename_column :clients, :pickup_datetime, :pickup_date
  end

  def down
    remove_column :clients, :pickup_date
    rename_column :clients, :pickup_date_bkp, :pickup_date
  end
end
