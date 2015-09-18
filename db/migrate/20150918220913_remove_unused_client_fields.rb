class RemoveUnusedClientFields < ActiveRecord::Migration
  def change
    remove_column :clients, :weight
  end
end
