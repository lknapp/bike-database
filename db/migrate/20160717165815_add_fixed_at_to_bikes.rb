class AddFixedAtToBikes < ActiveRecord::Migration[5.0]
  def change
    add_column :bikes, :fixed_at, :datetime
  end
end
