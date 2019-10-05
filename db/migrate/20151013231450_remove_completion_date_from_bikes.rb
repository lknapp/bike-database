class RemoveCompletionDateFromBikes < ActiveRecord::Migration[5.0]
  def change
    remove_column :bikes, :completion_date
  end
end
