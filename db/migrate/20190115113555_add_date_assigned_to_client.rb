class AddDateAssignedToClient < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :assigned_bike_at, :datetime
  end
end
