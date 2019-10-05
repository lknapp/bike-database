class RemoveEntryDateColumnFromBikes < ActiveRecord::Migration[5.0]
  def change
    remove_column :bikes, :entry_date
  end
end
