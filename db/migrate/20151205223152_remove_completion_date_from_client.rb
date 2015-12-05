class RemoveCompletionDateFromClient < ActiveRecord::Migration
  def change
    remove_column :clients, :completion_date
  end
end
