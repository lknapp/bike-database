class UpdateBikeFieldNames < ActiveRecord::Migration
  def change
    rename_column :bikes, :notes, :work_done
    rename_column :bikes, :tag_info, :new_parts
  end
end
