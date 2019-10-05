class RemoveUnusedBikeFields < ActiveRecord::Migration[5.0]
  def change
    remove_column :bikes, :work_done
    remove_column :bikes, :new_parts
  end
end
