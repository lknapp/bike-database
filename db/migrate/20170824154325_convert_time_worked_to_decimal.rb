class ConvertTimeWorkedToDecimal < ActiveRecord::Migration[5.0]
  def change
    change_column :bikes, :time_spent, :decimal, precision: 10, scale: 2
  end
end
