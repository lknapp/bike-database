class AddFixedAtToBikes < ActiveRecord::Migration
  def change
    add_column :bikes, :fixed_at, :datetime
  end
end
