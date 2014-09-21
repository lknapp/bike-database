class AddBikeTypeAndWillPayToClient < ActiveRecord::Migration
  def change
    add_column(:clients, :bike_type_requested, :string)
    add_column(:clients, :will_pay, :boolean)
  end
end
