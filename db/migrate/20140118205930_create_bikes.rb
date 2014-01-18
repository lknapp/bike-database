class CreateBikes < ActiveRecord::Migration
  def change
    add_column(:bikes, :created_at, :datetime)
    add_column(:bikes, :updated_at, :datetime)
  end
end
