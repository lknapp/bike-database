class AddHeightAndWeightToClient < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :weight, :float
    add_column :clients, :height, :float
  end
end
