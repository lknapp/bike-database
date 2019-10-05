class AddBikeIndexIdToBikes < ActiveRecord::Migration[5.0]
  def change
    add_column :bikes, :bike_index_id, :integer
  end
end
