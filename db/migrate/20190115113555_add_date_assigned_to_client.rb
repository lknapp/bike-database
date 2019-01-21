class AddDateAssignedToClient < ActiveRecord::Migration
  def change
    add_column :clients, :assigned_bike_at, :datetime
  end
end
