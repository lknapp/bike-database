class AddBikeIndexIdToBikes < ActiveRecord::Migration
  def change
    add_column :bikes, :bike_index_id, :integer
  end
end
