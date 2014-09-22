class RemoveAgencyStringFromClient < ActiveRecord::Migration
  def change
    remove_column :clients, :agency
  end
end
