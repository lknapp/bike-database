class AddHeightAndWeightToClient < ActiveRecord::Migration
  def change
    add_column :clients, :weight, :float
    add_column :clients, :height, :float
  end
end
