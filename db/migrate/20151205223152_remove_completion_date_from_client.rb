class RemoveCompletionDateFromClient < ActiveRecord::Migration[5.0]
  def change
    remove_column :clients, :completion_date
  end
end
