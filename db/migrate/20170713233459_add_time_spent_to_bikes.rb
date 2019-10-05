class AddTimeSpentToBikes < ActiveRecord::Migration[5.0]
  def change
    add_column :bikes, :time_spent, :int
  end
end
