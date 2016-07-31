class RemoveEntryDateColumnFromBikes < ActiveRecord::Migration
  def change
    remove_column :bikes, :entry_date
  end
end
