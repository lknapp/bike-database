class ChangeBikeDateSoldColumnToDateTime < ActiveRecord::Migration[5.0]
  def up
    change_column :bikes, :date_sold, :datetime
  end

  def down
    change_column :bikes, :date_sold, :date
  end
end
