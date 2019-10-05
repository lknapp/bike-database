class AddLocationToBikes < ActiveRecord::Migration[5.0]
  def change
    add_column :bikes, :location, :string
  end
end
