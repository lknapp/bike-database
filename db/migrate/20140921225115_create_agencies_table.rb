class CreateAgenciesTable < ActiveRecord::Migration
  def change
    create_table :agencies do |t|
      t.string :agency_name
      t.string :contact_name
      t.string :street_address
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :phone_number
      t.string :email
    end
  end
end
