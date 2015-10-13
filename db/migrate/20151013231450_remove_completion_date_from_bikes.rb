class RemoveCompletionDateFromBikes < ActiveRecord::Migration
  def change
    remove_column :bikes, :completion_date
  end
end
