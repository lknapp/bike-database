class ConvertTimeWorkedToDecimal < ActiveRecord::Migration
  def change
    change_column :bikes, :time_spent, :decimal, precision: 10, scale: 2
  end
end
