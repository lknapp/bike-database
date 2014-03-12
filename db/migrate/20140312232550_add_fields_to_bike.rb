class AddFieldsToBike < ActiveRecord::Migration
  def change
    add_column :bikes, :seat_tube_size, :float 
    add_column :bikes, :top_tube_size, :float 
    add_column :bikes, :log_number, :int
    add_column :bikes, :purpose, :text
    add_column :bikes, :mechanic, :text

    remove_column :bikes, :repaired_by
    remove_column :bikes, :sale
    remove_column :bikes, :freecyclery
  end
end
