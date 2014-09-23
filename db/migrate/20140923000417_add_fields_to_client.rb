class AddFieldsToClient < ActiveRecord::Migration
  def change
    add_column(:clients, :notes, :text)
    add_column(:clients, :bike_fixed, :boolean)
    add_column(:clients, :number_of_calls, :integer)
    add_column(:clients, :application_voided, :boolean)
    add_column(:clients, :pickup_date, :date)
    add_column(:clients, :volunteer_at_pickup, :string)
  end
end
