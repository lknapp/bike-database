class UpdateBikeFieldNames < ActiveRecord::Migration[5.0]
  def change
    rename_column :bikes, :notes, :work_done
    rename_column :bikes, :tag_info, :new_parts
  end
end
