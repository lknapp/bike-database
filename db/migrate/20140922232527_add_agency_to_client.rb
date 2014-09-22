class AddAgencyToClient < ActiveRecord::Migration
  def change
    add_reference :clients, :agency, index: true
  end
end
