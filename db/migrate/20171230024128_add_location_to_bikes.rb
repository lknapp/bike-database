class AddLocationToBikes < ActiveRecord::Migration
  def change
    add_column :bikes, :location, :string
  end
end
