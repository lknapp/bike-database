class RemoveAgencyStringFromClient < ActiveRecord::Migration[5.0]
  def change
    remove_column :clients, :agency
  end
end
