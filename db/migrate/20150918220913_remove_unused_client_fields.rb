class RemoveUnusedClientFields < ActiveRecord::Migration[5.0]
  def change
    remove_column :clients, :weight
  end
end
