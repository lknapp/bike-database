class ChangeTypeToBicycleType < ActiveRecord::Migration[5.0]
  def change
    rename_column(:bikes, :type, :bike_type)
  end
end
