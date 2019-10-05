class AddAgencyToClient < ActiveRecord::Migration[5.0]
  def change
    add_reference :clients, :agency, index: true
  end
end
