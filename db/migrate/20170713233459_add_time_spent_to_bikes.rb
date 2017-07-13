class AddTimeSpentToBikes < ActiveRecord::Migration
  def change
    add_column :bikes, :time_spent, :int
  end
end
